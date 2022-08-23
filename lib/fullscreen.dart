import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'dart:math';
import 'dart:async';

import 'package:reactiontime/main.dart';

import 'i18n/strings.g.dart' as i18n;

class FullScreenModel extends ChangeNotifier {
  int phase = 0;
  String centerText = i18n.t.fullscreen.tapToStart;
  String bottomText = "";
  Color appBarColor = Colors.green;

  void setPhase(int i) {
    phase = i;
    notifyListeners();
  }

  void setAppBarColor(Color c) {
    appBarColor = c;
    notifyListeners();
  }

  void setCenterText(String str) {
    centerText = str;
    notifyListeners();
  }

  void setBottomText(double t) {
    String b = "";
    if (t <= 0.1) {
      b = i18n.t.speed.superFast;
    } else if (t <= 0.2) {
      b = i18n.t.speed.fast;
    } else if (t <= 0.3) {
      b = i18n.t.speed.normal;
    } else {
      b = i18n.t.speed.slow;
    }
    bottomText = "${i18n.t.speed.speed}: $b";
    notifyListeners();
  }

  void removeBottomText() {
    bottomText = "";
    notifyListeners();
  }
}

class FullScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: context.watch<FullScreenModel>().appBarColor,
          title: Text(i18n.t.speedTest),
        ),
        body: Container(
            color: context.watch<FullScreenModel>().phase <= 1
                ? context.watch<FullScreenModel>().phase == 0
                    ? Colors.blue
                    : Colors.green
                : Colors.red,
            child: Material(
                color: Colors.transparent,
                child: InkWell(
                    onTapDown: (details) {
                      context.read<FullScreenModel>().phase <= 1
                          ? onTapInkwell(context)
                          : onTapToStop(context);
                    },
                    child: Container(
                      child: Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(context.watch<FullScreenModel>().centerText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 30)),
                          Text(context.watch<FullScreenModel>().bottomText)
                        ],
                      )),
                    )))));
  }
}

Stopwatch stpwtc = Stopwatch();
late Timer _timer;

void onTapInkwell(BuildContext c) async {
  c.read<FullScreenModel>().removeBottomText();
  if (c.read<FullScreenModel>().phase == 1) {
    _timer.cancel();
    stpwtc.stop();
    stpwtc.reset();
    c.read<FullScreenModel>().setPhase(0);
    c.read<FullScreenModel>().setCenterText(i18n.t.fullscreen.mistake);
    c.read<FullScreenModel>().setAppBarColor(Colors.blue);
    return;
  }

  stpwtc.reset();
  c.read<FullScreenModel>().setPhase(1);
  c.read<FullScreenModel>().setCenterText(i18n.t.fullscreen.tapWhenRed);
  c.read<FullScreenModel>().setAppBarColor(Colors.green);
  var t = Random().nextInt(4000) + 2000;
  _timer = Timer(Duration(milliseconds: t), () {
    c.read<FullScreenModel>().setPhase(2);
    c.read<FullScreenModel>().setCenterText(i18n.t.fullscreen.tap);
    c.read<FullScreenModel>().setAppBarColor(Colors.red);
    stpwtc.start();
  });
}

void onTapToStop(BuildContext c) {
  c.read<FullScreenModel>().removeBottomText();
  if (c.read<FullScreenModel>().phase == 3) {
    c.read<FullScreenModel>().setPhase(0);
    c.read<FullScreenModel>().setCenterText(i18n.t.fullscreen.tapToStart);
    c.read<FullScreenModel>().setAppBarColor(Colors.blue);
    return;
  }

  stpwtc.stop();
  c.read<FullScreenModel>().setPhase(3);
  double score = stpwtc.elapsedMilliseconds / 1000;
  c
      .read<FullScreenModel>()
      .setCenterText(i18n.t.fullscreen.score(count: (score).toString()));
  c.read<FullScreenModel>().setBottomText(score);
  if (prefs.getDouble("fullscreen_fastest") == null ||
      prefs.getDouble("fullscreen_fastest")! > score) {
    prefs.setDouble("fullscreen_fastest", score);
  }
}

void initFullScreen(BuildContext context) {
  context.read<FullScreenModel>().centerText = i18n.t.fullscreen.tapToStart;
  context.read<FullScreenModel>().phase = 0;
  context.read<FullScreenModel>().setAppBarColor(Colors.blue);
}
