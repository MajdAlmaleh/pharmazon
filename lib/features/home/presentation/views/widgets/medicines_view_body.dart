import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/medicines_list_view.dart';

class MedicinesViewBody extends StatefulWidget {
  final String classificationName;
  const MedicinesViewBody({
    super.key,
    required this.classificationName,
  });

  @override
  State<MedicinesViewBody> createState() => _MedicinesViewBodyState();
}

class _MedicinesViewBodyState extends State<MedicinesViewBody> {
  @override
  void initState() {
    BlocProvider.of<MedicineFromClassCubit>(context)
        .fetchMedicineOfClassification(
            classification: widget.classificationName);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineFromClassCubit, MedicineFromClassState>(
      builder: (context, state) {
        if (state is MedicineFromClassLoading) {
          return const CustomLoading();
        }
        if (state is MedicineFromClassFailure) {
          return CustomError(
            errMessage: state.errMessage,
          );
        }
        if (state is MedicineFromClassSuccess) {
          return MedicinesListView(medicines: state.medicineFromClass,);
        }
        return const Text('there is no medicines to show'); 
      },
    );
  }
}
