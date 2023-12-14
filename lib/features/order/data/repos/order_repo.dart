import 'package:dartz/dartz.dart';
import 'package:pharmazon/core/errors/failures.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';
import 'package:pharmazon/features/order/data/models/order/order.details.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';

abstract class OrderRepo {
  Future<Either<Failure,  Map<String,dynamic>>> postDelivery( List<OrderItemModel?> orderItems );
    Future<Either<Failure,  List<DateModel>>> getDatesFromUser({required String userId});
  Future<Either<Failure,  OrderDetails>> getOrderDetailsFromDate({required  DateModel dateModel});

//Future<Either<Failure,String> > getOrders();
//List<OrderItemModel>

}
