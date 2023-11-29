import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/features/home/data/models/classifications_model.dart';
import 'package:pharmazon/features/home/data/repos/home_repo.dart';
import 'package:pharmazon/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService _apiService;
  HomeRepoImpl(this._apiService);
  @override
  Future<void> logOut({required String token}) async {
  final tokenCubit = TokenCubit();
    await _apiService.delete(
        urlEndPoint: '$kBaseUrl/logout',
        body: {
          'api_token': token,
        },
        token: null);
    tokenCubit.deleteSavedToken();
  }

  @override
  Future<Either<Failure, List<ClassificationsModel>>>
      fetchClassifications({required String token}) async {
        //make the token with the token cubit

    try {
      final  data = await _apiService.get(url: '$kBaseUrl/getAll', token: token);
      print(data);
      List<ClassificationsModel> classifications = [];
      for (var item in data) {
        classifications.add(ClassificationsModel(clssification: item));
      }
      print(classifications.length);

      return Right(classifications);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
