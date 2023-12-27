part of 'sales_report_cubit.dart';

sealed class SalesReportState extends Equatable {
  const SalesReportState();

  @override
  List<Object> get props => [];
}

final class SalesReportInitial extends SalesReportState {}

final class SalesReportLoading extends SalesReportState {}

final class SalesReportFailure extends SalesReportState {
  final String errMessage;
  const SalesReportFailure({required this.errMessage});
}

final class SalesReportSuccess extends SalesReportState {
  final SalesReportModel saleReportModel;

  const SalesReportSuccess(this.saleReportModel);
}
