import 'package:equatable/equatable.dart';

abstract class OrderState extends Equatable {
  const OrderState();

  @override
  List<Object> get props => [];
}

class OrderInitial extends OrderState {}

class OrderSuccess extends OrderState {
  final String orderItems;

  const OrderSuccess(this.orderItems);
}

class OrderLoading extends OrderState {}

class OrderFailure extends OrderState {
  final String errMessage;

  const OrderFailure({required this.errMessage});
}
