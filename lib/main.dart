import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontime/ninebuttons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'fullscreen.dart';
import 'i18n/strings.g.dart';
import 'settings.dart';

class MainModel extends ChangeNotifier {
  MainModel() {
    initBannerAd();
  }

  double? fastestFullscreen;
  double? fastest9buttons;

  void setFastestFullscreen(double d) {
    fastestFullscreen = d;
    notifyListeners();
  }

  void setFastestNineBUttons(double d) {
    fastest9buttons = d;
    notifyListeners();
  }

  void getHighscore() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fastestFullscreen = prefs.getDouble("fullscreen_fastest");
      fastest9buttons = prefs.getDouble("ninebuttons_fastest");
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
