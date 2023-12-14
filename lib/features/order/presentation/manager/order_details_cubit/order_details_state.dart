part of 'order_details_cubit.dart';

sealed class OrderDetailsState extends Equatable {
  const OrderDetailsState();

  @override
  List<Object> get props => [];
}

final class OrderDetailsInitial extends OrderDetailsState {}

final class OrderDetailsLoading extends OrderDetailsState {}

final class OrderDetailsFailure extends OrderDetailsState {
  final String errMessage;
  const OrderDetailsFailure({required this.errMessage});
}

final class OrderDetailsSuccess extends OrderDetailsState {
  final OrderDetails order;

  const OrderDetailsSuccess(this.order);
}