import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';
import 'package:pharmazon/features/order/data/models/order/order.details.dart';
import 'package:pharmazon/features/order/data/repos/order_repo.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
     final OrderRepo orderRepo;


  OrderDetailsCubit(this.orderRepo) : super(OrderDetailsInitial());




 Future<void> fetchOrderDetailsFromDate({required DateModel dateModel}) async {
    emit(OrderDetailsLoading());

    final result = await orderRepo.getOrderDetailsFromDate(dateModel: dateModel);

    result.fold((failure) {
      emit(OrderDetailsFailure(errMessage: failure.errMessage));
    }, (orderDetails) {
      emit(OrderDetailsSuccess(orderDetails));
    });
  }

}
