import 'package:flutter/material.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/home_drawrer.dart';

import 'widgets/medicines_view_body.dart';

class MedicinesView extends StatelessWidget {
  final String classificationName;
  const MedicinesView({super.key, required this.classificationName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(classificationName),
      ),
      //  drawer: const HomeDrawrer(),
      body: MedicinesViewBody(
        classificationName: classificationName,
      ),
    );
  }
}
