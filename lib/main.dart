import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontime/mashbutton.dart';
import 'package:reactiontime/ninebuttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'fullscreen.dart';
import 'i18n/strings.g.dart';
import 'settings.dart';

class MainModel extends ChangeNotifier {
  MainModel() {
    initBannerAd();
    AppOpenAdManager appOpenAdManager = AppOpenAdManager()..loadAd();
    WidgetsBinding.instance
        .addObserver(AppLifecycleReactor(appOpenAdManager: appOpenAdManager));
  }

  double? fastestFullscreen;
  double? fastest9buttons;
  int? highestMashButton;

  void getHighscore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fastestFullscreen = prefs.getDouble("fullscreen_fastest");
      fastest9buttons = prefs.getDouble("ninebuttons_fastest");
      highestMashButton = prefs.getInt("mashbutton_highest");
      notifyListeners();
    });
  }

  BannerAd? banner;

  void initBannerAd() {
    print("Ads: initBannerAd");

    banner = BannerAd(
        size: AdSize.banner,
        adUnitId: _getBannerId,
        listener: const BannerAdListener(),
        request: const AdRequest());
  }

  BannerAd? loadBannerAd() {
    print("Ads: loadBannerAd");
    banner?.load();
    return banner;
  }
}

String get _getBannerId {
  if (Platform.isIOS) {
    return "ca-app-pub-6224025297466109/8452911645";
  } else {
    return "ca-app-pub-6224025297466109/1952541349";
  }
}

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  prefs = await SharedPreferences.getInstance();
  MobileAds.instance.initialize();

  runApp(MultiProvider(providers: [
    ListenableProvider(create: (context) => MainModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: t.speedTest,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        home: Main());
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<MainModel>().getHighscore();
    double? fastestFullscreen = context.watch<MainModel>().fastestFullscreen;
    double? fastest9buttons = context.watch<MainModel>().fastest9buttons;
    int? highestMashButton = context.watch<MainModel>().highestMashButton;

    BannerAd? ba = context.read<MainModel>().loadBannerAd();

    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              darkmodeDisabled(context) ? Colors.grey : Colors.black,
          title: Text(
            t.reactionTime,
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                splashRadius: 23,
                onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return Settings();
                    })),
                icon: const Icon(Icons.settings)),
            const SizedBox(width: 10)
          ],
        ),
        body: Column(children: [
          Expanded(
              child: Center(
                  child: GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.all(10.0),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              startButton(context, FullScreen(),
                  imageName: "fullscreen",
                  bottomText: "Fullscreen",
                  highscore: fastestFullscreen != null
                      ? t.fastest(count: fastestFullscreen.toString())
                      : t.noDataYet),
              startButton(context, NineButtons(),
                  imageName: "ninebuttons",
                  bottomText: "9 Buttons",
                  highscore: fastest9buttons != null
                      ? t.fastest(count: fastest9buttons.toString())
                      : t.noDataYet),
              startButton(context, MashButton(),
                  imageName: "mashbutton",
                  bottomText: "Mash Button",
                  highscore: highestMashButton != null
                      ? t.highest(count: highestMashButton)
                      : t.noDataYet)
            ],
          ))),
          ba != null
              ? SizedBox(
                  height: ba.size.height.toDouble(),
                  width: ba.size.width.toDouble(),
                  child: AdWidget(ad: ba))
              : const SizedBox(),
        ]));
  }
}

Widget startButton(BuildContext context, Widget page,
    {String imageName = "", String bottomText = "", String highscore = ""}) {
  return SizedBox(
      child: ElevatedButton(
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        primary: darkmodeDisabled(context) ? Colors.white : Colors.white),
    onPressed: () =>
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return page;
    })),
    child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset("assets/images/$imageName.png", width: 50, height: 50),
      const SizedBox(height: 15),
      Text(bottomText, style: TextStyle(color: Colors.black)),
      Text(
        highscore,
        style: TextStyle(color: Colors.grey),
      )
    ])),
  ));
}

bool darkmodeDisabled(BuildContext context) {
  return MediaQuery.of(context).platformBrightness != Brightness.dark;
}

class AppOpenAdManager {
  String adUnitId = Platform.isAndroid
      ? 'ca-app-pub-6224025297466109/7432060742'
      : 'ca-app-pub-6224025297466109/7069346087';

  AppOpenAd? _appOpenAd;
  bool _isShowingAd = false;

  void loadAd() {
    AppOpenAd.load(
      adUnitId: adUnitId,
      orientation: AppOpenAd.orientationPortrait,
      request: AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          _appOpenAd = ad;
        },
        onAdFailedToLoad: (error) {
          print('AppOpenAd failed to load: $error');
          // Handle the error.
        },
      ),
    );
  }

  /// Whether an ad is available to be shown.
  bool get isAdAvailable {
    return _appOpenAd != null;
  }

  void showAdIfAvailable() {
    if (!isAdAvailable) {
      print('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (_isShowingAd) {
      print('Tried to show ad while already showing an ad.');
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    _appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        _isShowingAd = true;
        print('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
      },
      onAdDismissedFullScreenContent: (ad) {
        print('$ad onAdDismissedFullScreenContent');
        _isShowingAd = false;
        ad.dispose();
        _appOpenAd = null;
        loadAd();
      },
    );
  }
}

class AppLifecycleReactor extends WidgetsBindingObserver {
  final AppOpenAdManager appOpenAdManager;

  AppLifecycleReactor({required this.appOpenAdManager});

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    // Try to show an app open ad if the app is being resumed and
    // we're not already showing an app open ad.
    if (state == AppLifecycleState.resumed) {
      appOpenAdManager.showAdIfAvailable();
    }
  }
}
