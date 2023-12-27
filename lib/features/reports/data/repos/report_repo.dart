import 'package:dartz/dartz.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/features/reports/data/models/sales_report_model/sales_report_model.dart';
//import 'package:pharmazon/features/reports/data/models/sale_report_model/sale_report_model.dart';
 abstract class ReportRepo {
  Future<Either<Failure, SalesReportModel>> getSalesReportFromDate(
      {required int month, required int year});
//   Future<Either<Failure, QuantityReport>> getQuantityReportFromDate(
//       {required int month, required int year});
 }
