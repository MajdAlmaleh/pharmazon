import 'package:dartz/dartz.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/core/shared_models/classifications_model.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ClassificationsModel>>> searchByClassifications( {required String classification});
  Future<Either<Failure, List<MedicineModel>>> searchByCommercialName(
      {required String commercialName});
}
