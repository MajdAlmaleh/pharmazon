class OrderItemModel {
  final int? id;
   int? orderQuantity;
   OrderItemModel({this.id, this.orderQuantity});


  Map<String, dynamic> toJson() => {
        'pharmaceutical_id': id,
        'quantity': orderQuantity,
      };
  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>OrderItemModel (
       id: json['pharmaceutical_id'],
       orderQuantity:json['quantity'] ,
  );
}
