import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/medicines_list_view.dart';
import 'package:pharmazon/features/order/presentation/manager/order_details_cubit/order_details_cubit.dart';

class OrderDetailsViewBody extends StatelessWidget {
  const OrderDetailsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        if (state is OrderDetailsLoading) {
          return const CustomLoading();
        }
        if (state is OrderDetailsFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is OrderDetailsSuccess) {
          print(state.orderDetails.pharmaceuticals!);
          if (state.orderDetails.pharmaceuticals!.isEmpty) {
            return const Text('empty');
          }
          return Card(
              child: Column(
            children: [
              ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                     state.orderDetails.order!.status=='cancel'? MaterialStateProperty.all<Color>(Colors.red):MaterialStateProperty.all<Color>(Colors.green),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: Text(
                  state.orderDetails.order!.status.toString(),
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
               ElevatedButton(
                onPressed: null,
                style: ButtonStyle(
                  backgroundColor:
                     state.orderDetails.order!.status=='unpaid'? MaterialStateProperty.all<Color>(Colors.red):MaterialStateProperty.all<Color>(Colors.green),
                  elevation: MaterialStateProperty.all<double>(0),
                ),
                child: Text(
                  state.orderDetails.order!.payment.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              
              Expanded(
                  child: MedicinesListView(
                medicines: state.orderDetails.pharmaceuticals!,
                isOrder: true,
              )),
            ],
          ));
        }
        return const Center(child: Text('there is no clients'));

        // return Expanded(
        //   child: ListView.builder(
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return Card(
        //         child: ListTile(
        //           title: const Text('state.clients[index].clientName!'),
        //           onTap: () {
        //             //todo navigate to detalis
        //           //  context.go('location');
        //           },
        //         ),
        //       );
        //     },
        //   ),
        // );
      },
    );
  }
}
