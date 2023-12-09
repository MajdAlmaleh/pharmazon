import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_cubit.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key, required this.medicineModel});
  final MedicineModel medicineModel;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.medicineModel.commercialName!),
              Text(widget.medicineModel.calssification!),
              Text(widget.medicineModel.expireDate!),
              Text(widget.medicineModel.id.toString()),
              Text(widget.medicineModel.price.toString()),
              Text(widget.medicineModel.manufactureCompany!),
              Text(widget.medicineModel.quantityAvailable.toString()),
              ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context)
                        .addItem(widget.medicineModel.id!, 1,widget.medicineModel);
                    setState(() {});
                  },
                  child: const Text('add')),
              Text(
                  'quantity ${BlocProvider.of<CartCubit>(context).getItemQuatity(widget.medicineModel.id!)}'),
            ],
          ),
        ),
      ),
    );
  }
}
