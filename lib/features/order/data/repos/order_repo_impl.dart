import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';
import 'package:pharmazon/features/order/data/repos/order_repo.dart';

class OrderRepoImpl implements OrderRepo {
  final ApiService _apiService;
  final TokenCubit tokenCubit;

  OrderRepoImpl(this._apiService) : tokenCubit = GetIt.instance<TokenCubit>();

  @override
  Future<Either<Failure, Map<String, dynamic>>> postDelivery(
      List<OrderItemModel?> orderItems) async {
    try {
      final data = await _apiService.post(
          url: '$kBaseUrl/order',
          token: tokenCubit.state,
          body: {"order": orderItems});
      List<OrderItemModel> medicines = [];
      for (var item in data['order']) {
        medicines.add(OrderItemModel.fromJson(item));
      }

      return Right(data);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
