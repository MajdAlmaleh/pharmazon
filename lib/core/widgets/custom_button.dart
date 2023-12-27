import 'package:flutter/material.dart';
import 'package:pharmazon/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: kAppColor,
        minimumSize: const Size(300, 70),
      ),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white, fontSize: (25)),
      ),
    );
  }
}
