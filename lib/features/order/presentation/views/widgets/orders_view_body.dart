// orders_view_body.dart
import 'package:flutter/material.dart';
import 'package:pharmazon/features/order/presentation/views/widgets/all_dates.dart';

import 'sales_report.dart';
import 'tab_bar_widget.dart';

class OrdersViewBody extends StatefulWidget {
  const OrdersViewBody({Key? key}) : super(key: key);

  @override
  OrdersViewBodyState createState() => OrdersViewBodyState();
}

class OrdersViewBodyState extends State<OrdersViewBody> {
  int bodyIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarWidget(onTabChange: (value) => setState(() => bodyIndex = value)),
        bodyIndex == 0 ? const AllDates() : const SalesReport(),
      ],
    );
  }
}
