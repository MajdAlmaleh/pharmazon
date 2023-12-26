import 'package:flutter/material.dart';

class SearchOptionItem extends StatelessWidget {
  const SearchOptionItem(
      {super.key, required this.text, this.color = Colors.grey});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: SizedBox(
        height: 40,
        width: 150,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
