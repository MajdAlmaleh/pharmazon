import 'package:flutter/material.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/home_drawrer.dart';

import 'widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Order'),
      ),
      drawer: const HomeDrawrer(),
      body: const OrderViewBody(),
    );
  }
}
