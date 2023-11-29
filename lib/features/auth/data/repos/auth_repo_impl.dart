import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:universal_platform/universal_platform.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit = TokenCubit();
  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> signInWithEmailAndPassword(
      {required String phoneNumber, required String password}) async {
    const storage = FlutterSecureStorage();

    try {
      final response = await _apiService.post(
        urlEndPoint: '$kBaseUrl/login',
        body: {
          'phone': phoneNumber,
          'password': password,
          'ispharmacy': UniversalPlatform.isAndroid,
          'iswarehouse': !UniversalPlatform.isAndroid,
        },
        token: null, // Replace with your token if needed
      );

      await tokenCubit.storeToken(response['token']);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> signUpWithEmailAndPassword(
      {required String username,
      required String phoneNumber,
      required String password}) async {
    const storage = FlutterSecureStorage();

    try {
      final response = await _apiService.post(
        urlEndPoint: '$kBaseUrl/users', // Replace with your register endpoint
        body: {
          'name': username,
          'phone': phoneNumber,
          'password': password,
          'ispharmacy': UniversalPlatform.isAndroid,
          'iswarehouse': !UniversalPlatform.isAndroid,
        },
        token: null,
        // Replace with your token if needed
      );
      await tokenCubit.storeToken(response['token']);
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
