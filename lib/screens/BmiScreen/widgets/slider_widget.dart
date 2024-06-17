import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Consumer<AppState>(builder: (context, appState, child) {
          return Slider(
              value: appState.height,
              max: 252,
              label: appState.height.toString(),
              divisions: 252,
              onChanged: (val) {
                appState.updateHeight(val);
              });
        })

        //  Slider(
        //     value: _currentSliderValue,
        //     max: 252,
        //     label: _currentSliderValue.round().toString(),
        //     divisions: 252,
        //     onChanged: (double value) {
        //       setState(() {
        //         _currentSliderValue = value;
        //       });
        //     }),
        );
  }
}
