import 'package:flutter/material.dart';
import 'package:pharmazon/core/shared_models/classifications_model.dart';
import 'package:pharmazon/core/widgets/classification_item.dart';

class ClassificationsGridView extends StatelessWidget {
  final List<ClassificationsModel> classifications;
  const ClassificationsGridView({
    super.key,
    required this.classifications,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: classifications.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 7 / 8,
      ),
      itemBuilder: (context, index) {
        return ClassificationItem(
            classificotionName: classifications[index].clssification!);
      },
    );
  }
}
