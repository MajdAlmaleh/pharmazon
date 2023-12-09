import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_cubit.dart';

class MedicineBubble extends StatefulWidget {
  const MedicineBubble({
    super.key,
    required this.medicineModel,
     this.isMedicineOrder=false,
  });
final bool isMedicineOrder;
  final MedicineModel medicineModel;

  @override
  State<MedicineBubble> createState() => _MedicineBubbleState();
}

class _MedicineBubbleState extends State<MedicineBubble> {



  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(widget.medicineModel.price.toString()),
        title: Text(widget.medicineModel.commercialName!),
        onTap: () {
          GoRouter.of(context)
              .push(AppRouter.kMedicineDetail, extra: widget.medicineModel);
        },
        trailing: widget.isMedicineOrder?Text(BlocProvider.of<OrderCubit>(context).getItemQuatity(widget.medicineModel.id!).toString()):null,
      ),
      
    );
  }
}
