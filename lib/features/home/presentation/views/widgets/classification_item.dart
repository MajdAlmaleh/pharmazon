import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';

class ClassificationItem extends StatelessWidget {
  const ClassificationItem({
    super.key,
    required this.classificotionName,
  });

  final String classificotionName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO SEND A REQUEST conatis the classification name to the backend
        BlocProvider.of<MedicineFromClassCubit>(context)
            .fetchMedicineOfClassification(classification: classificotionName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          classificotionName,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
