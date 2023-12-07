import 'package:flutter/material.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/widgets/medicine_bubble.dart';

class MedicinesListView extends StatelessWidget {
  final List<MedicineModel> medicines;
  const MedicinesListView({
    super.key, required this.medicines,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return MedicineBubble(medicineModel: medicines[index]);
      },
      
    );
  }
}
