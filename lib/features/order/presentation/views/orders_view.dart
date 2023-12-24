import 'package:flutter/material.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/home_drawrer.dart';
import 'package:pharmazon/features/order/presentation/views/widgets/orders_view_body.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dates of orders'),
        ),
        //  drawer: const HomeDrawrer(
        //  pageName: 'cart',
        // ),
        body: const OrdersViewBody());
  }
}
