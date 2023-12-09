import 'package:dartz/dartz.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';

abstract class OrderRepo {
  Future<Either<Failure,  Map<String,dynamic>>> postDelivery( List<OrderItemModel?> orderItems );

//List<OrderItemModel>

}
