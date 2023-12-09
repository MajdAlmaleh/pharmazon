import 'package:equatable/equatable.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<OrderItemModel?> orderItems;

  const CartUpdated(this.orderItems);

  @override
  List<Object> get props => [orderItems];
}
