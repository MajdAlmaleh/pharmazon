import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/features/reports/data/models/sales_report_model/sales_report_model.dart';
import 'package:pharmazon/features/reports/data/repos/report_repo.dart';

class ReportRepoImpl implements ReportRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit;

  ReportRepoImpl(this._apiService) : tokenCubit = GetIt.instance<TokenCubit>();

  @override
  Future<Either<Failure, SalesReportModel>> getSalesReportFromDate(
      {required int month, required int year}) async {
    try {
      final data = await _apiService
          .post(url: '$kBaseUrl/Report-user', token: tokenCubit.state, body: {
        "month": month,
        "year": year,
      });
      final salesData = SalesReportModel.fromJson(data);
      print(salesData);
    

      return Right(salesData);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

}
