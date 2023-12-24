import 'package:dartz/dartz.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/core/shared_models/classifications_model.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/features/order/data/models/order/pharmaceutical.details.dart';

abstract class HomeRepo {
  Future<void> logOut();
  Future<Either<Failure, List<ClassificationsModel>>> fetchClassifications();
  Future<Either<Failure, List<Pharmaceutical>>> fetchMedicineOfClassification(
      {required String classification});

Future<Either<Failure, Map<String,dynamic>>> changeFavoriteState({required String id});
Future<Either<Failure, List<Pharmaceutical>>> getFavoriteItems();
    
}
