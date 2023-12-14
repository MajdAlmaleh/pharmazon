import 'package:flutter/material.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/home_drawrer.dart';
import 'package:pharmazon/features/order/presentation/views/widgets/orders_view_body.dart';


class OrdersView extends StatelessWidget {
  final String clientModel;
  const OrdersView({super.key, required this.clientModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dates for $clientModel '),
        ),
        drawer: const HomeDrawrer(
            //  pageName: 'cart',
            ),
        body: const OrdersViewBody());
  }
}
