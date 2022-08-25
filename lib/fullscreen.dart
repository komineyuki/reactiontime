import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';

import 'package:reactiontime/main.dart';

import 'i18n/strings.g.dart' as i18n;

class FullScreen extends StatefulWidget {
  @override
  _FullScreen createState() => _FullScreen();
}

class _FullScreen extends State<FullScreen> {
  int phase = 0;
  String centerText = i18n.t.fullscreen.tapToStart;
  String bottomText = "";
  Color appBarColor = Colors.blue;

  void setPhase(int i) {
    if (mounted) {
      setState(() => phase = i);
    }
  }

  void setAppBarColor(Color c) {
    if (mounted) {
      setState(() => appBarColor = c);
    }
  }

  void setCenterText(String str) {
    if (mounted) {
      setState(() => centerText = str);
    }
  }

  void setBottomText(double t) {
    String b = "";
    if (t <= 0.18) {
      b = i18n.t.speed.superFast;
    } else if (t <= 0.22) {
      b = i18n.t.speed.fast;
    } else if (t <= 0.3) {
      b = i18n.t.speed.normal;
    } else if (t <= 10) {
      b = i18n.t.speed.slow;
    } else {
      b = i18n.t.speed.areyoukiddingme;
    }
    if (mounted) {
      setState(() => bottomText = "${i18n.t.speed.speed}: $b");
    }
  }

  void removeBottomText() {
    if (mounted) {
      setState(() => bottomText = "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: appBarColor,
          title: Text(i18n.t.speedTest),
        ),
        body: Container(
            color: phase <= 1
                ? phase == 0
                    ? Colors.blue
                    : Colors.green
                : Colors.red,
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTapDown: (details) {
                      phase <= 1 ? onTapInkwell(context) : onTapToStop(context);
                    },
                    child: Container(
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(centerText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30)),
                          Text(bottomText)
                        ],
                      )),
                    )))));
  }

  Stopwatch stpwtc = Stopwatch();
  late Timer _timer;

  void onTapInkwell(BuildContext c) async {
    removeBottomText();
    if (phase == 1) {
      _timer.cancel();
      stpwtc.stop();
      stpwtc.reset();
      setPhase(0);
      setCenterText(i18n.t.fullscreen.mistake);
      setAppBarColor(Colors.blue);
      return;
    }

    stpwtc.reset();
    setPhase(1);
    setCenterText(i18n.t.fullscreen.tapWhenRed);
    setAppBarColor(Colors.green);
    var t = Random().nextInt(4000) + 2000;
    _timer = Timer(Duration(milliseconds: t), () {
      setPhase(2);
      setCenterText(i18n.t.fullscreen.tap);
      setAppBarColor(Colors.red);
      stpwtc.start();
    });
  }

  void onTapToStop(BuildContext c) {
    removeBottomText();
    if (phase == 3) {
      setPhase(0);
      setCenterText(i18n.t.fullscreen.tapToStart);
      setAppBarColor(Colors.blue);
      return;
    }

    stpwtc.stop();
    setPhase(3);
    double score = stpwtc.elapsedMilliseconds / 1000;
    setCenterText(i18n.t.fullscreen.score(count: (score).toString()));
    setBottomText(score);
    if (prefs.getDouble("fullscreen_fastest") == null ||
        prefs.getDouble("fullscreen_fastest")! > score) {
      prefs.setDouble("fullscreen_fastest", score);
    }
  }

  void initFullScreen(BuildContext context) {
    centerText = i18n.t.fullscreen.tapToStart;
    phase = 0;
    setAppBarColor(Colors.blue);
  }
}
