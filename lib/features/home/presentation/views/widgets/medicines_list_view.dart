import 'package:flutter/material.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/widgets/medicine_bubble.dart';

class MedicinesListView extends StatelessWidget {
  final List<MedicineModel> medicines;
final bool isMedicineOrder;
  const MedicinesListView({
    super.key, required this.medicines,
   this.isMedicineOrder= false ,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (context, index) {

        return MedicineBubble(medicineModel: medicines[index],isMedicineOrder: isMedicineOrder,);

      },
      
    );
  }
}
