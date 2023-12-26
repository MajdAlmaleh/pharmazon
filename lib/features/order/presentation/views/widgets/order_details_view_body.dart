import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/medicines_list_view.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';
import 'package:pharmazon/features/order/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:pharmazon/generated/l10n.dart';

late String orderState;
late String orderPayment;

class OrderDetailsViewBody extends StatelessWidget {
  final DateModel dateModel;
  const OrderDetailsViewBody({
    super.key,
    required this.dateModel,
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
          if (state.orderDetails.pharmaceuticals!.isEmpty) {
            return Text(S.of(context).ThereIsNoMedicines);
          }
          switch (state.orderDetails.order!.status.toString()) {
            case 'cancel':
              {
                orderState = S.of(context).cancel;
                break;
              }
            case 'in process':
              {
                orderState = S.of(context).inProcess;
                break;
              }
            case 'in preparation':
              {
                orderState = S.of(context).inPreparation;
                break;
              }
            case 'send':
              {
                orderState = S.of(context).send;
                break;
              }
            default:
              {
                orderState = 'error';
              }
          }
          switch (state.orderDetails.order!.payment) {
            case 'paid':
              {
                orderPayment = S.of(context).paid;
                break;
              }
            case 'unpaid':
              {
                orderPayment = S.of(context).unPaid;
                break;
              }

            default:
              {
                orderPayment = 'error';
              }
          }

          return Card(
              child: LiquidPullToRefresh(
            color: kAppColor,
            onRefresh: () async {
              BlocProvider.of<OrderDetailsCubit>(context)
                  .fetchOrderDetailsFromDate(dateModel: dateModel);
            },
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        state.orderDetails.order!.status == 'cancel'
                            ? MaterialStateProperty.all<Color>(Colors.red)
                            : MaterialStateProperty.all<Color>(Colors.green),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  child: Text(
                    orderState,
                    style: const TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor:
                        state.orderDetails.order!.status == 'unpaid'
                            ? MaterialStateProperty.all<Color>(Colors.red)
                            : MaterialStateProperty.all<Color>(Colors.green),
                    elevation: MaterialStateProperty.all<double>(0),
                  ),
                  child: Text(
                    orderPayment,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Expanded(
                    child: MedicinesListView(
                  medicines: state.orderDetails.pharmaceuticals!,
                  isOrder: true,
                )),
              ],
            ),
          ));
        }
        return  Center(child: Text(S.of(context).ThereIsNoMedicines));
      },
    );
  }
}
