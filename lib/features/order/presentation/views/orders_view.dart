import 'package:flutter/material.dart';
import 'package:pharmazon/features/order/presentation/views/widgets/orders_view_body.dart';
import 'package:pharmazon/generated/l10n.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text(S.of(context).datesOfOrders),
        ),
   
        body: const OrdersViewBody());
  }
}
