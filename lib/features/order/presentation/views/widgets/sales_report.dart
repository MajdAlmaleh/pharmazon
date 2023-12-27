// orders_view_body.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/functions/custom_snack_bar.dart';
import 'package:pharmazon/core/widgets/custom_button.dart';


class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  SalesReportState createState() => SalesReportState();
}

class SalesReportState extends State<SalesReport> {
  int? selectedMonth;
  int? selectedYear;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              const Spacer(),
                 DropdownButton(
                  hint: const Text('select month'),
                  value: selectedMonth,
                  items: [
                    for (var i = 1; i <= 12; i++)
                      DropdownMenuItem(value: i, child: Text('$i')),
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      selectedMonth = value;
                    });
                  },
                ),
                const Spacer(),
                DropdownButton(
                  hint: const Text('select year'),
                  value: selectedYear,
                  items: [
                    for (var i = 0; i <= 3; i++)
                      DropdownMenuItem(
                          value: 2023 + i, child: Text('${2023 + i}')),
                  ],
                  onChanged: (int? value) {
                    setState(() {
                      selectedYear = value;
                    });
                  },
                ),
                const Spacer(),
            ],
          ),
          const Spacer(),
          CustomButton(
            onPressed: () => _onShowReportButtonPressed(context),
            text: 'Show Report',
          ),
          const Spacer(),
        ],
      ),
    );
  }

  void _onShowReportButtonPressed(BuildContext context) {
    if (selectedMonth == null || selectedYear == null) {
      ScaffoldMessenger.of(context).clearSnackBars;
      customSnackBar(context, 'Please select month and year');
      return;
    }
    context.push(AppRouter.kSalesReportFromDate,
        extra: '$selectedMonth/$selectedYear');
  }
}