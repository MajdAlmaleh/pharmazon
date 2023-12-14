import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
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
          print(state.order.pharmaceuticals!);
          if (state.order.pharmaceuticals!.isEmpty) {
            return const Text('empty');
          }
          return Card(
              child: Column(
            children: [Text(state.order.pharmaceuticals![0].price.toString())],
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
