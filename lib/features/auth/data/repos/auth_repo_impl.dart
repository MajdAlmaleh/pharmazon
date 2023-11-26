import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService _apiService;

  AuthRepoImpl(this._apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> signInWithEmailAndPassword(
      {required String phoneNumber, required String password}) async {
        const storage =  FlutterSecureStorage();
   
    try {
      final response = await _apiService.post(
        urlEndPoint: '$kBaseUrl/login',
        body: {
          'phone': phoneNumber,
          'password': password,
        },


        token: null, // Replace with your token if needed
      );

await storage.write(key: 'token', value: phoneNumber);

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
                const storage =  FlutterSecureStorage();

    try {
      final response = await _apiService.post(
        urlEndPoint: '$kBaseUrl/users', // Replace with your register endpoint
        body: {
          'name': username,
          'phone': phoneNumber,
          'password': password,
          'ispharmacy': Platform.isAndroid,
          'iswarehouse': !Platform.isAndroid,
        },
        token: null,
        // Replace with your token if needed
      );
      await storage.write(key: 'token', value: phoneNumber);


      //TODO add token to the storage;
      return right(response);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
