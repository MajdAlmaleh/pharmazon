import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/core/shared_models/classifications_model.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit;

  SearchRepoImpl(this._apiService) : tokenCubit = GetIt.instance<TokenCubit>();
  @override
  @override
  Future<Either<Failure, List<ClassificationsModel>>> searchByClassifications(
      {required String classification}) async {
    //make the token with the token cubit

    try {
      final data = await _apiService.get(
        url: '$kBaseUrl/saerch',
        token: tokenCubit.state,
        body: {"calssification": classification},
      );
      List<ClassificationsModel> classifications = [];
      for (var item in data['the results of the calssification:']) {
        classifications.add(ClassificationsModel(clssification: item));
      }

      return Right(classifications);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<MedicineModel>>> searchByCommercialName(
      {required String commercialName}) async {
    try {
      final data = await _apiService.get(
          url: '$kBaseUrl/saerchComp',
          token: tokenCubit.state,
          body: {"commercial_name": commercialName});
      List<MedicineModel> medicines = [];
      for (var item in data['the results of the commercial name:']) {
        medicines.add(MedicineModel.fromJson(item));
      }

      return Right(medicines);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
