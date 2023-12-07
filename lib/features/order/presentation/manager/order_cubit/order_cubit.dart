import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/features/order/data/models/order_item_model.dart';
import 'package:pharmazon/features/order/data/repos/order_repo.dart';
import 'package:pharmazon/features/order/presentation/manager/order_cubit/order_state.dart';

//part 'delivery_event.dart';
//part 'delivery_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderRepo orderRepo;
  OrderCubit(this.orderRepo) : super(OrderInitial());

  List<OrderItemModel?> orderItems = [];

  void addItem(int id, int quantity) {
    var existingItem =
        orderItems.firstWhere((item) => item!.id == id, orElse: () => null);

    if (existingItem != null) {
      // If the item already exists in the list, increase its quantity
      existingItem.orderQuantity = (existingItem.orderQuantity ?? 0) + quantity;
    } else {
      // If the item does not exist in the list, add it
      orderItems.add(OrderItemModel(id: id, orderQuantity: quantity));
    }

    for (int i = 0; i < orderItems.length; i++) {
      print('id ${orderItems[i]!.id}');
      print(orderItems[i]!.orderQuantity);
    }

    emit(OrderUpdated(orderItems));
  }

  int getItemQuatity(int id) {
    var existingItem =
        orderItems.firstWhere((item) => item!.id == id, orElse: () => null);

    if (existingItem == null) {
      // If the item already exists in the list, increase its quantity
      return 0;
    } else {
      // If the item does not exist in the list, add it
      return existingItem.orderQuantity!;
    }
  }

  void postDelivery() async {
    print('Delivery posted: $orderItems');
    emit(OrderLoading());

    final result =
        await orderRepo.postDelivery(orderItems as List<OrderItemModel>);

    result.fold((failure) {
      emit(OrderFailure(errMessage: failure.errMessage));
    }, (orderItems) {
      emit(OrderSuccess(orderItems));
       orderItems = [];
    });

    // TODO: send a list to the route
   
  }
}
