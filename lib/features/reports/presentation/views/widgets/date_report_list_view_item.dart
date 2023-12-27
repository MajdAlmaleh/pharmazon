import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';
import 'package:pharmazon/features/reports/data/models/sales_report_model/order.dart';

class DateReportListViewItem extends StatelessWidget {
  final Order order;
  const DateReportListViewItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      child: Card(
        child: InkWell(
          onTap: () {
            final dateModel = DateModel(
                date: (order.createdAt).toString().replaceAll(' ', 'T'));
            context.push(AppRouter.kOrderDetailsFromDate, extra: dateModel);
          },
          child: ListTile(
            leading: const Icon(
              Icons.date_range,
              color: Colors.black,
              size: 40,
            ),
            title: Text(
              order.createdAt.toString().split(' ')[0],
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(
              order.createdAt.toString().split(' ')[1].split('.')[0],
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
            trailing: Text(
              order.totalePrice!,
            ),
          ),
        ),
      ),
    );
  }
}
