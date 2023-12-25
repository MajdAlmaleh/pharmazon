import 'package:flutter/material.dart';

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
