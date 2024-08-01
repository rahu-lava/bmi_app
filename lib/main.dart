import 'package:bmi_app/screens/BmiScreen/bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider( 
      create: (context) => AppState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}

class AppState extends ChangeNotifier {
  int _weight = 40;
  double _height = 30;
  double _bmi = 0;

  int get weight => _weight;
  double get height => _height;
  double get bmi => _bmi;

  void updateWeight(int val) {
    _weight = val;
    notifyListeners();
  }

  void updateBmi(double val) {
    _bmi = val;
    notifyListeners();
  }

  void incrementWeight() {
    _weight++;
    notifyListeners();
  }

  void decrementWeight() {
    _weight--;
    notifyListeners();
  }

  void updateHeight(double val) {
    _height = val;
    notifyListeners();
  }
}
