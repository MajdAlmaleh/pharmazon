import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/features/home/presentation/manager/favorite_item/favorite_item_cubit.dart';
import 'package:pharmazon/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';

class MedicineBubble extends StatefulWidget {
  const MedicineBubble({
    super.key,
    required this.medicineModel,
    this.isOrder = false,
  });
  final bool isOrder;
  final Pharmaceutical medicineModel;

  @override
  State<MedicineBubble> createState() => _MedicineBubbleState();
}

class _MedicineBubbleState extends State<MedicineBubble> {
  late bool fakeState;
  @override
  void initState() {
    super.initState();
    fakeState = widget.medicineModel.isFavorite??false;
  }

  @override
  Widget build(BuildContext context) {
    return
        //  Card(
        //   child: ListTile(
        //     leading: Text(medicineModel.price.toString()),
        //     title: Text(medicineModel.commercialName!),
        //     onTap: () {
        //       GoRouter.of(context)
        //           .push(AppRouter.kMedicineDetail, extra: medicineModel);
        //     },
        //   ),
        // );

        Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: InkWell(
          onTap: widget.isOrder
              ? null
              : () {
                  GoRouter.of(context).push(AppRouter.kMedicineDetail,
                      extra: widget.medicineModel);
                },
          child: ListTile(
            leading: const Icon(
              Icons.medical_information,
              color: Colors.black,
              size: 40,
            ),
            trailing: !widget.isOrder
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        fakeState = !fakeState;
                      });
                      BlocProvider.of<FavoriteItemCubit>(context)
                          .changeFavoriteState(
                              id: widget.medicineModel.id.toString());
                      BlocProvider.of<FavoriteItemCubit>(context)
                          .getFavoriteItems();
                    },
                    icon: fakeState
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite),
                  )
                : Text(widget.medicineModel.price.toString()),
            title: Text(
              widget.medicineModel.scientificName!,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(
              widget.medicineModel.commercialName!,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
