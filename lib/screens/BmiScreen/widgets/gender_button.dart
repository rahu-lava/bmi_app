import 'package:flutter/material.dart';

class GenderButton extends StatefulWidget {
  const GenderButton({super.key});

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  bool _isBorderVisible1 = false;
  bool _isBorderVisible2 = false;

  void _toggleBorder1() {
    setState(() {
      _isBorderVisible1 = !_isBorderVisible1;
      _isBorderVisible2 = false;
    });
  }

  void _toggleBorder2() {
    setState(() {
      _isBorderVisible2 = !_isBorderVisible2;
      _isBorderVisible1 = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: _toggleBorder1,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
                border:
                    _isBorderVisible1 ? Border.all(color: Colors.black) : null),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "lib/assets/man.png",
                width: 100,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: _toggleBorder2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
                border:
                    _isBorderVisible2 ? Border.all(color: Colors.black) : null),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "lib/assets/woman.png",
                width: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
