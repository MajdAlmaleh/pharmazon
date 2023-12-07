import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/app_router.dart';

class ClassificationItem extends StatelessWidget {
  const ClassificationItem({
    super.key,
    required this.classificotionName,
  });

  final String classificotionName;

 
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()  {
        GoRouter.of(context).push(AppRouter.kMedicinesView,extra: classificotionName);
   
      },
      child: Stack(
        children: [
          Image.asset(
            'assets/images/medicine.jpg',
            height: 200,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            alignment: Alignment.center,
            child: Text(
              classificotionName,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
