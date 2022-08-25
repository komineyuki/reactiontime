import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactiontime/ninebuttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fullscreen.dart';
import 'i18n/strings.g.dart';
import 'settings.dart';

class MainModel extends ChangeNotifier {
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
}

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  prefs = await SharedPreferences.getInstance();
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

    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              darkmodeDisabled(context) ? Colors.grey : Colors.black,
          title: Text(
            t.reactionTime,
            style: TextStyle(color: Colors.white),
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
        body: Center(
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
        )));
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
        backgroundColor:
            darkmodeDisabled(context) ? Colors.white : Colors.white),
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
