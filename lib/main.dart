import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'fullscreen.dart';
import 'i18n/strings.g.dart';
import 'settings.dart';

class MainModel extends ChangeNotifier {
  double? fastestFullscreen;
  void setFastestFullscreen(double d) {
    fastestFullscreen = d;
    notifyListeners();
  }

  void getFastestFullscreen() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fastestFullscreen = prefs.getDouble("fullscreen_fastest");
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
    ListenableProvider(create: (context) => FullScreenModel())
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
    context.watch<MainModel>().getFastestFullscreen();
    double? faastestFullscreen = context.watch<MainModel>().fastestFullscreen;

    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              darkmodeDisabled(context) ? Colors.grey : Colors.black,
          title: Text(
            t.speedTest,
            style: TextStyle(
                color: darkmodeDisabled(context) ? Colors.black : Colors.white),
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
        body:
            // Scrollbar(
            //     child: SingleChildScrollView(
            //         child:  Column(children: [_element(context, "全画面", FullScreen())])
            //             ))
            Center(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
          Center(
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(
                    color: darkmodeDisabled(context)
                        ? Colors.black
                        : Colors.white),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FullScreen();
                }));

                initFullScreen(context);
              },
              child: Text(
                t.startTest,
                style: TextStyle(
                    color: darkmodeDisabled(context)
                        ? Colors.black
                        : Colors.white),
              ),
            ),
          ),
          Text(faastestFullscreen != null
              ? t.fullscreen.fastest(count: faastestFullscreen.toString())
              : t.noDataYet)
        ])));
  }
}

Widget _element(BuildContext context, String title, Widget navi) {
  return Container(
    width: 150,
    height: 100,
    decoration: const BoxDecoration(
        color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(20))),
    child: Material(
        child: InkWell(
            child: Container(color: Colors.transparent),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return navi;
              }));

              initFullScreen(context);
            })),
  );
}

bool darkmodeDisabled(BuildContext context) {
  return MediaQuery.of(context).platformBrightness != Brightness.dark;
}
