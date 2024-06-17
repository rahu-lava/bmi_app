import 'dart:math';
import 'package:bmi_app/main.dart';
import 'package:bmi_app/screens/BmiScreen/bmi_screen.dart';
import 'package:bmi_app/screens/ResultScreen/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class SwipeAble extends StatefulWidget {
  const SwipeAble({super.key});

  @override
  State<SwipeAble> createState() => _SwipeAbleState();
}

class _SwipeAbleState extends State<SwipeAble> {
  bool _isFinished = false;
  double _bmiScore = 0;
  // int _height = 150, _weight = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: SwipeableButtonView(
          isFinished: _isFinished,
          onFinish: () async {
            await Navigator.push(
                context,
                PageTransition(
                    child: ResultScreen(), type: PageTransitionType.fade));

            setState(() {
              _isFinished = true;
            });
          },
          onWaitingProcess: () => {
                calculateBmi(),
                Future.delayed(const Duration(seconds: 1), () {
                  setState(() {
                    _isFinished = true;
                  });
                })
              }, // Future.delayed,
          activeColor: Colors.blueAccent,
          buttonWidget: const Icon(Icons.arrow_forward_ios_rounded),
          buttonText: "Calculate"),
    );
  }

  calculateBmi() {
    final appState = Provider.of<AppState>(context, listen: false);

    _bmiScore = appState.weight / pow(appState.height / 100, 2);
    Provider.of<AppState>(context, listen: false).updateBmi(_bmiScore);
  }
}
