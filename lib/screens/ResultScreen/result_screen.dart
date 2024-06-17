import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

String? bmiStatus;

String? bmiInterpretation;

Color? bmiStatusColor;

int? bmiScore;

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    setBmiInterpretation(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("BMI Score"),
      ),
      body: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        child: Card(
          color: Colors.white,
          elevation: 14,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Your Score",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
              SizedBox(height: 30),
              Consumer<AppState>(builder: (context, appstate, child) {
                return PrettyGauge(
                  gaugeSize: 300,
                  minValue: 0,
                  maxValue: 40,
                  segments: [
                    GaugeSegment('UnderWeight', 18.5, Colors.red),
                    GaugeSegment('Normal', 6.4, Colors.green),
                    GaugeSegment('OverWeight', 5, Colors.orange),
                    GaugeSegment('Obese', 10.1, Colors.pink),
                  ],
                  valueWidget: Text(
                    appstate.bmi.toStringAsFixed(1),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  currentValue: appstate.bmi,
                  needleColor: Colors.blue,
                );
              }),
              SizedBox(height: 10),
              Text(
                bmiStatus!,
                style: TextStyle(fontSize: 20, color: bmiStatusColor!),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                bmiInterpretation!,
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Re-Calculate")),
                  ElevatedButton(
                      onPressed: () {
                        Share.share(
                            "Your BMI is ${bmiScore?.toStringAsFixed(1)}");
                      },
                      child: const Text("Share")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void setBmiInterpretation(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    bmiScore = appState.bmi.toInt();

    if (bmiScore! > 30) {
      bmiStatus = "Obese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore! >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise & reduce the weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore! >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy, You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore! < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;
    }
  }
}
