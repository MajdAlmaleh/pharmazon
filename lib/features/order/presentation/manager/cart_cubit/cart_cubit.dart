import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_state.dart';

class CartCubit extends Cubit<CartState> {
  List<OrderItemModel?> orderItems = [];
  List<MedicineModel> orderMedicines = [];

  CartCubit():super(CartInitial());
  

  List<MedicineModel> getOrderMedicines() {
    return orderMedicines;
  }

  bool checkIfEmpty() {
    return orderItems.isEmpty;
  }

 void resetItems(){
orderItems = [];

orderMedicines = [];

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
    emit(CartUpdated(orderItems));
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
  
}
