import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/functions/custom_snack_bar.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/medicines_list_view.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_cubit.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_state.dart';

class OrderViewBody extends StatefulWidget {
  const OrderViewBody({
    super.key,
  });

  @override
  State<OrderViewBody> createState() => _OrderViewBodyState();
}

class _OrderViewBodyState extends State<OrderViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<OrderCubit, OrderState>(
          listener: (context, state) {
            if (state is OrderSuccess) {
              customSnackBar(context, state.orderItems);
              context.pop();
            }
          },
          builder: (context, state) {
            if (state is OrderLoading) {
              return const CustomLoading();
            }
            if (state is OrderFailure) {
              return CustomError(errMessage: state.errMessage);
            }
            final medicines =
                BlocProvider.of<CartCubit>(context).getOrderMedicines();

            if (medicines.isNotEmpty) {
              return Expanded(
                child: MedicinesListView(
                  medicines: medicines,
                  isOrder: true,
                ),
              );
            }
            return const Center(
              child: Text('No medicines in the cart yet'),
            );
          },
        ),
        if (BlocProvider.of<CartCubit>(context).getOrderMedicines().isNotEmpty)
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<OrderCubit>(context).postDelivery();
                BlocProvider.of<CartCubit>(context).resetItems();
              },
              child: const Text('send order'))
      ],
    );
  }
}
