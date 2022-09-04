import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'i18n/strings.g.dart';
import 'main.dart';

class NineButtons extends StatefulWidget {
  @override
  _NineButtons createState() => _NineButtons();
}

class _NineButtons extends State<NineButtons> {
  late int redNum = -1;
  bool started = false;
  String upperText = "Tap any button to start!";
  String bottomText = "";
  int tappedCount = 0;
  bool missed = false;
  bool preparing = false;

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
              Text(t.ninebuttons.ninebuttons),
            ],
          ),
          backgroundColor: started ? Colors.red : Colors.blue,
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            Text(
              upperText,
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                padding: EdgeInsets.all(10.0),
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                children: [for (int i = 0; i < 9; i++) button(i)]),
            const SizedBox(height: 5),
            Text(bottomText, style: const TextStyle(fontSize: 18)),
          ],
        )));
  }

  Stopwatch stpwtc = Stopwatch();
  late Timer _timer;

  void tapped(int index) async {
    if (index == redNum) {
      setState(() {
        tappedCount++;
        do {
          redNum = Random().nextInt(9);
        } while (redNum == index);
        upperText = "$tappedCount / 10";
      });

      if (tappedCount >= 10) {
        stpwtc.stop();
        double s = stpwtc.elapsedMilliseconds / 1000;
        setState(() {
          upperText = "Time:" + s.toString() + "s";
          bottomText = "${t.speed.speed}: ${speed(s)}";
        });

        if (prefs.getDouble("ninebuttons_fastest") == null ||
            prefs.getDouble("ninebuttons_fastest")! > s) {
          prefs.setDouble("ninebuttons_fastest", s);
        }

        init();
      }
    } else {
      setState(() {
        upperText = "Missed!";
        missed = true;
        init();
      });
    }
  }

  String speed(double _time) {
    if (_time <= 3.8) {
      return t.speed.superFast;
    } else if (_time <= 4.2) {
      return t.speed.fast;
    } else if (_time <= 4.8) {
      return t.speed.normal;
    } else if (_time <= 30) {
      return t.speed.slow;
    } else {
      return t.speed.areyoukiddingme;
    }
  }

  void init() {
    setState(() {
      preparing = false;
      started = false;
      stpwtc.stop();
      stpwtc.reset();
    });
  }

  void startTap() async {
    if (preparing) {
      return;
    }
    preparing = true;

    setState(() {
      bottomText = "${t.ninebuttons.tapred}";
      tappedCount = 0;
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
          upperText = "Tap Red!";
          redNum = Random().nextInt(9);
          started = true;
        });
        stpwtc.reset();
        stpwtc.start();
      }
    });
  }

  Widget button(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              blurRadius: 3,
              spreadRadius: 0,
              color: darkmodeDisabled(context)
                  ? Colors.grey
                  : Color.fromARGB(255, 52, 52, 52))
        ],
      ),
      child: Material(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: started
              ? index == redNum
                  ? Colors.red
                  : Colors.white
              : Colors.blue,
          child: InkWell(
              onTap: () {
                if (started) {
                  tapped(index);
                } else {
                  startTap();
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              )))),
    );
  }
}
