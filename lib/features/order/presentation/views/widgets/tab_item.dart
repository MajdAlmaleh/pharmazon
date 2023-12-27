// orders_view_body.dart

import 'package:flutter/material.dart';
import 'package:pharmazon/constants.dart';

class TabItem extends StatelessWidget {
  final String label;

  const TabItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kAppColor,
        borderRadius: BorderRadius.circular(20),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(label),
        ),
      ),
    );
  }
}
