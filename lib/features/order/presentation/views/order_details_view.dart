import 'package:flutter/material.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';
import 'package:pharmazon/features/order/presentation/views/widgets/order_details_view_body.dart';


class OrderDetailsView extends StatelessWidget {
  final DateModel dateModel;
  const OrderDetailsView({super.key, required this.dateModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dateModel.date!.split('T')[0]),
      ),
      body: const OrderDetailsViewBody(),
    );
  }
}
