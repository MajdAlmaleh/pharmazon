import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';

class DateListViewItem extends StatelessWidget {
  final DateModel date;
  const DateListViewItem({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8,left: 8,right: 8),
      child: Card(
        child: InkWell(
          onTap: () {
            context.push(AppRouter.kOrderDetailsFromDate, extra: date);
          },
          child: ListTile(
            
            leading: const Icon(
              Icons.date_range,
              color: Colors.black,
              size: 40,
            ),
            title: Text(
              date.date!.split('T')[0],
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            subtitle: Text(
              date.date!.split('T')[1].split('.')[0],
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ),
        ),
      ),
    );
  }
}
