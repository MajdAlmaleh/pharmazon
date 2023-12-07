import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/utils/app_router.dart';

class MedicineBubble extends StatelessWidget {
  const MedicineBubble({
    super.key,
    required this.medicineModel,
  });

  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(medicineModel.price.toString()),
        title: Text(medicineModel.commercialName!),
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.kMedicineDetail, extra: medicineModel);
        },
      ),
      
    );
  }
}
