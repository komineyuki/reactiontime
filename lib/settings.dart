import 'package:flutter/material.dart';

import 'i18n/strings.g.dart';
import 'main.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
  List<String> languages = ["ar", "de", "en", "ja", "nl", "no", "sv"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(t.settings.settings),
          backgroundColor:
              darkmodeDisabled(context) ? Colors.grey : Colors.black,
        ),
        body: Center(
            child: Scrollbar(
                child: SingleChildScrollView(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
          GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              padding: EdgeInsets.all(10.0),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 2,
              children: [for (var str in languages) languageButton(str)]),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                prefs.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.settings.clearedAllData)));
              },
              child: Text(t.settings.clearAllData))
        ])))));
  }

  Widget languageButton(String str) {
    String l = "English";
    switch (str) {
      case "ar":
        l = "عربي";
        break;
      case "de":
        l = "Deutsch";
        break;
      case "ja":
        l = "日本語";
        break;
      case "nl":
        l = "Nederlands";
        break;
      case "no":
        l = "Noors";
        break;
      case "sv":
        l = "svenska";
        break;
      case "en":
        l = "English";
        break;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: () {
        LocaleSettings.setLocaleRaw(str);
        prefs.setString("lan", str);
        Navigator.pop(context);
      },
      child: Text(l),
    );
  }
}
