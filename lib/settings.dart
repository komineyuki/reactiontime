import 'package:flutter/material.dart';

import 'i18n/strings.g.dart';
import 'main.dart';

class Settings extends StatefulWidget {
  @override
  _Settings createState() => _Settings();
}

class _Settings extends State<Settings> {
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
          ElevatedButton(
              onPressed: () {
                prefs.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(t.settings.clearedAllData)));
              },
              child: Text(t.settings.clearAllData))
        ])))));
  }
}
