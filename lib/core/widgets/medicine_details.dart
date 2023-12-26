import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmazon/generated/l10n.dart';

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
        title:  Text('${S.of(context).medicineDetailsfor} ${widget.medicineModel.commercialName}' ),
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
                  Text('${S.of(context).commercialName}: ${widget.medicineModel.commercialName!}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text(
                      '${S.of(context).calssification}: ${widget.medicineModel.calssification!}'),
                  Text('${S.of(context).expireDate}: ${widget.medicineModel.expireDate!}'),
                  Text('${S.of(context).price}: ${widget.medicineModel.price.toString()}'),
                  Text(
                      '${S.of(context).manufactureCompany}: ${widget.medicineModel.manufactureCompany!}'),
                  Text(
                      '${S.of(context).quantityAvailable}: ${widget.medicineModel.quantityAvailable.toString()}'),
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
                  Text('${S.of(context).quantityInCart}: ${BlocProvider.of<CartCubit>(context).getItemQuatity(widget.medicineModel.id!)}'),
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
