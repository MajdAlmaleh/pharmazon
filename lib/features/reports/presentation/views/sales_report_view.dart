import 'package:flutter/material.dart';
import 'package:pharmazon/generated/l10n.dart';

import 'widgets/sales_report_view_body.dart';

class SalesReportView extends StatelessWidget {
  final String date;
  const SalesReportView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${S.of(context).salesReportOf} $date'),
      ),
      body: const SalesReportViewBody(),
    );
  }
}
