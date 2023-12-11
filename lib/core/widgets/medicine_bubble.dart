import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_cubit.dart';

class MedicineBubble extends StatelessWidget {
  const MedicineBubble({
    super.key,
    required this.medicineModel,
     this.isMedicineOrder=false,
  });
final bool isMedicineOrder;
  final MedicineModel medicineModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(medicineModel.price.toString()),
        title: Text(medicineModel.commercialName!),
        onTap:isMedicineOrder?null: () {
          GoRouter.of(context)
              .push(AppRouter.kMedicineDetail, extra: medicineModel);
        },
        trailing: isMedicineOrder?Text(BlocProvider.of<CartCubit>(context).getItemQuatity(medicineModel.id!).toString()):null,
      ),
      
    );
  }
}
