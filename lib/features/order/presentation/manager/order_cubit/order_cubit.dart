import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';
import 'package:pharmazon/features/order/data/repos/order_repo.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_state.dart';

//part 'delivery_event.dart';
//part 'delivery_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  OrderCubit(this.orderRepo) : super(OrderInitial());

  List<OrderItemModel?> orderItems = [];
  List<MedicineModel> orderMedicines = [];
  bool checkIfEmpty() {
    if (orderItems.isEmpty) {
      return false;
    }
    return true;
  }

  List<MedicineModel> getOrderMedicines() {
    return orderMedicines;
  }

  void addItem(int id, int quantity, MedicineModel orderMedicine) {
    var existingItem =
        orderItems.firstWhere((item) => item!.id == id, orElse: () => null);

    if (existingItem != null) {
      existingItem.orderQuantity = (existingItem.orderQuantity ?? 0) + quantity;
    } else {
      orderItems.add(OrderItemModel(id: id, orderQuantity: quantity));
      orderMedicines.add(orderMedicine);
    }
    emit(OrderUpdated(orderItems));
  }

  int getItemQuatity(int id) {
    var existingItem =
        orderItems.firstWhere((item) => item!.id == id, orElse: () => null);

    if (existingItem == null) {
      return 0;
    } else {
      return existingItem.orderQuantity!;
    }
  }

  void postDelivery() async {
    emit(OrderLoading());

    final result = await orderRepo.postDelivery(orderItems);

    result.fold((failure) {
      emit(OrderFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(OrderSuccess(success['message']));
      orderItems = [];
      orderMedicines = [];
    });

  }
}
