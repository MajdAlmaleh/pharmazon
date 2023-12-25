import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';

class MedicineDetails extends StatefulWidget {
  const MedicineDetails({super.key, required this.medicineModel});
  final Pharmaceutical medicineModel;

  @override
  State<MedicineDetails> createState() => _MedicineDetailsState();
}

class _MedicineDetailsState extends State<MedicineDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${widget.medicineModel.commercialName!}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                      'Classification: ${widget.medicineModel.calssification!}'),
                  Text('Expire Date: ${widget.medicineModel.expireDate!}'),
                  Text('ID: ${widget.medicineModel.id.toString()}'),
                  Text('Price: ${widget.medicineModel.price.toString()}'),
                  Text(
                      'Manufacturer: ${widget.medicineModel.manufactureCompany!}'),
                  Text(
                      'Quantity Available: ${widget.medicineModel.quantityAvailable.toString()}'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(context)
                              .addItem(1, widget.medicineModel);
                          setState(() {});
                        },
                        icon: const Icon(Icons.add),
                      ),
                      const SizedBox(width: 10),
                  Text('Quantity in Cart: ${BlocProvider.of<CartCubit>(context).getItemQuatity(widget.medicineModel.id!)}'),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {
                          if (BlocProvider.of<CartCubit>(context)
                                  .getItemQuatity(widget.medicineModel.id!) >
                              0) {
                            BlocProvider.of<CartCubit>(context)
                                .addItem(-1, widget.medicineModel);
                            setState(() {});
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                 // const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
