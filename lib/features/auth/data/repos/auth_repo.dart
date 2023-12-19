import 'package:dartz/dartz.dart';
import 'package:pharmazon/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, Map<String, dynamic>>> signInWithEmailAndPassword(
      {required String phoneNumber, required String password});
  Future<Either<Failure, Map<String, dynamic>>> signUpWithEmailAndPassword(
      {required String username,
      required String phoneNumber,
      required String password});
}

