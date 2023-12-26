import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/features/order/data/repos/order_repo.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  final CartCubit cartCubit;

  OrderCubit(this.orderRepo, this.cartCubit) : super(OrderInitial());

  void postDelivery() async {
    emit(OrderLoading());

    final result = await orderRepo.postDelivery(cartCubit.orderItems,cartCubit.totalPrice);

    result.fold((failure) {
      emit(OrderFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(OrderSuccess(success['message']));
     
    });
  }
}