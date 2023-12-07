class OrderItemModel {
  final int? id;
   int? orderQuantity;
   OrderItemModel({this.id, this.orderQuantity});


  Map<String, dynamic> toJson() => {
        'id': id,
        'order_quantity': orderQuantity,
      };

}
