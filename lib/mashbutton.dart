import 'dart:async';

import 'package:flutter/material.dart';

import 'i18n/strings.g.dart';
import 'main.dart';

class MashButton extends StatefulWidget {
  @override
  _MashButton createState() => _MashButton();
}

class _MashButton extends State<MashButton> {
  bool started = false;
  bool preparing = false;
  late Timer _timer;
  int count = 0;

  bool pushable = true;

  String upperText = t.fullscreen.tapToStart;
  String bottomText = "";

  Color buttonColor = Colors.blue;

  void init() {
    count = 0;
    setState(() {
      started = false;
      preparing = false;
      buttonColor = Colors.blue;
    });
  }

  void setButtonColor(Color c) {
    if (mounted) {
      setState(() => buttonColor);
    }
  }

  void tapped() {
    if (started) {
      count++;
    }
  }

  void startTap() {
    if (preparing) {
      return;
    }

    setState(() {
      preparing = true;
      bottomText = "${t.ninebuttons.tapred}";
      bottomText = "";
      count = 0;
      upperText = "3";
    });
    _timer = Timer(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          upperText = "2";
        });
      }
    });
    _timer = Timer(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          upperText = "1";
        });
      }
    });
    _timer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          upperText = t.mashbutton.mashbutton;
          started = true;
          buttonColor = Colors.red;
        });
      }
    });
    _timer = Timer(const Duration(seconds: 6), () {
      if (mounted) {
        setState(() {
          upperText = t.mashbutton.score(count: count);
          bottomText = "${t.speed.speed}: ${score()}";
        });
        pushable = false;

        bool b1 = prefs.getInt("mashbutton_highest") == null;
        bool b2 = b1 || prefs.getInt("mashbutton_highest")! < count;

        if (b1 || b2) {
          prefs.setInt("mashbutton_highest", count);
        }
        init();
      }
    });
    _timer = Timer(const Duration(milliseconds: 6750), () {
      if (mounted) {
        pushable = true;
      }
    });
  }

  String score() {
    if (count >= 26) {
      return t.speed.superFast;
    } else if (count >= 21) {
      return t.speed.fast;
    } else if (count >= 16) {
      return t.speed.normal;
    } else if (count >= 1) {
      return t.speed.slow;
    } else {
      return t.speed.areyoukiddingme;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                loadInterstitial();
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              splashRadius: 25,
            ),
            Text(t.mashbutton.mashbutton)
          ],
        ),
      ),
      body: Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
          upperText,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 70,
          width: 70,
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: buttonColor,
            child: InkWell(
              onTap: () {
                if (pushable) {
                  started ? tapped() : startTap();
                }
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
        const SizedBox(height: 35),
        Text(
          bottomText,
          style: const TextStyle(fontSize: 17),
        ),
      ])),
    );
  }
}
