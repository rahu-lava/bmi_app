import 'package:bmi_app/main.dart';
import 'package:bmi_app/screens/BmiScreen/widgets/age_weight_button.dart';
import 'package:bmi_app/screens/BmiScreen/widgets/gender_button.dart';
import 'package:bmi_app/screens/BmiScreen/widgets/slider_widget.dart';
import 'package:bmi_app/screens/BmiScreen/widgets/swipeable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class BmiScreen extends StatelessWidget {
  const BmiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
            child: Text(
          "B M I   C A L C U L A T O R",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
        )),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 25),
          const Text(
            "Select Gender",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 25,
          ),
          const GenderButton(),
          const SizedBox(
            height: 25,
          ),
          const Text(
            "Height",
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer<AppState>(builder: (context, appstate, child) {
            return Text(appstate.height.toString(),
                style: const TextStyle(fontSize: 24));
          }),
          const SliderWidget(),
          const AgeWeightButton(),
          const SizedBox(
            height: 40,
          ),
          const SwipeAble()
        ],
      )),
    );
  }
}
