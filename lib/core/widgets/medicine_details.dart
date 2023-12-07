import 'package:flutter/material.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';

class MedicineDetails extends StatelessWidget {
  const MedicineDetails({super.key, required this.medicineModel});
  final MedicineModel medicineModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(medicineModel.commercialName!),
              Text(medicineModel.calssification!),
              Text(medicineModel.expireDate!),
              Text(medicineModel.id.toString()),
              Text(medicineModel.price.toString()),
              Text(medicineModel.manufactureCompany!),
              Text(medicineModel.quantityAvailable.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
