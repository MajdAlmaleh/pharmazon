import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/reports/presentation/manager/sales_cubit/sales_report_cubit.dart';
import 'package:pharmazon/generated/l10n.dart';

import 'date_report_list_view_item.dart';

class SalesReportViewBody extends StatelessWidget {
  const SalesReportViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SalesReportCubit, SalesReportState>(
      builder: (context, state) {
        if (state is SalesReportLoading) {
          return const CustomLoading();
        }
        if (state is SalesReportFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is SalesReportSuccess) {
          if (state.saleReportModel.orders!.isEmpty) {
            return CustomError(
                errMessage: S.of(context).thereIsNoMedicinesForThisMonth);
          }
          return Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        S.of(context).totalPaidForThisMonth,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Text(double.parse(
                              (state.saleReportModel.totalPaid)!.toStringAsFixed(2))
                          .toString()),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: state.saleReportModel.orders!.length,
                  itemBuilder: (context, index) {
                    return DateReportListViewItem(
                      order: state.saleReportModel.orders![
                          state.saleReportModel.orders!.length - index - 1],
                    );
                  },
                ),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
