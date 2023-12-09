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

class OrderViewBody extends StatelessWidget {
  const OrderViewBody({
    super.key,
  });

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
            return Expanded(
              child: MedicinesListView(
                medicines:
                    BlocProvider.of<CartCubit>(context).getOrderMedicines(),
                isMedicineOrder: true,
              ),
            );
          },
        ),
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
