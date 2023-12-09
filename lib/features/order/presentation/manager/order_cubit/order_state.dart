import 'package:equatable/equatable.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderUpdated extends OrderState {
  final List<OrderItemModel?> orderItems;

  const OrderUpdated(this.orderItems);

  @override
  List<Object> get props => [orderItems];
}

class OrderSuccess extends OrderState {
    final String  orderItems;
//List<OrderItemModel>
  const OrderSuccess(this.orderItems);
}

class OrderLoading extends OrderState {}

class OrderFailure extends OrderState {
  final String errMessage;
  const OrderFailure({required this.errMessage});
}
