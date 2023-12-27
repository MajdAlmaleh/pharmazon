import 'package:flutter/material.dart';

import 'widgets/sales_report_view_body.dart';

class SalesReportView extends StatelessWidget {
  final String date;
  const SalesReportView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Report of $date'),
      ),
      body: const SalesReportViewBody(),
    );
  }
}
