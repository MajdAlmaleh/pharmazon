import 'package:flutter/material.dart';

import 'widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
      ),
      //  drawer: const HomeDrawrer(
      //    pageName: 'cart',
      //  ),
        body: const OrderViewBody(),
    );
  }
}
