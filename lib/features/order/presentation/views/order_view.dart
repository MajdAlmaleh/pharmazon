import 'package:flutter/material.dart';
import 'package:pharmazon/generated/l10n.dart';

import 'widgets/order_view_body.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).myOrder),
      ),
      body: const OrderViewBody(),
    );
  }
}
