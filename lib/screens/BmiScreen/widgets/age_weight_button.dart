import 'package:bmi_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class AgeWeightButton extends StatefulWidget {
  const AgeWeightButton({super.key});

  @override
  State<AgeWeightButton> createState() => _AgeWeightButtonState();
}

class _AgeWeightButtonState extends State<AgeWeightButton> {
  int age = 35;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                "Age",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  InkWell(
                      onTap: () => {
                            setState(() {
                              age--;
                            })
                          },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blueAccent),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "$age",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                      onTap: () => {
                            setState(() {
                              age++;
                            })
                          },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blueAccent),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
          Column(
            children: [
              const SizedBox(height: 15),
              const Text(
                "Weight",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  InkWell(
                      onTap: () => {
                            // setState(() {
                            //   weight--;
                            // })
                            Provider.of<AppState>(context, listen: false)
                                .decrementWeight()
                          },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blueAccent),
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Consumer<AppState>(builder: (context, appstate, child) {
                    return Text(
                      appstate.weight.toString(),
                      style: const TextStyle(fontSize: 20),
                    );
                  }),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                      onTap: () => {
                            // setState(() {
                            //   weight++;
                            // })
                            Provider.of<AppState>(context, listen: false)
                                .incrementWeight()
                          },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.blueAccent),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 15),
            ],
          )
        ],
      ),
    );
  }
}
