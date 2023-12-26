import 'package:flutter/material.dart';
import 'package:pharmazon/core/widgets/medicine_bubble.dart';
import 'package:pharmazon/features/order/data/models/order/pharmaceutical.details.dart';

class MedicinesListView extends StatelessWidget {
  final List<Pharmaceutical> medicines;
  final bool isOrder;
  final bool isCart;
  const MedicinesListView({
    super.key,
    required this.medicines,
    this.isOrder = false,
    this.isCart=false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: medicines.length,
      itemBuilder: (context, index) {
        return MedicineBubble(
          medicineModel: medicines[index],
          isOrder: isOrder,
          isCart: isCart,
        );
      },
    );
  }
}
