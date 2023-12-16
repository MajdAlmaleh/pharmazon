import 'package:equatable/equatable.dart';
import 'package:pharmazon/features/order/data/models/order/order.dart';

import 'pharmaceutical.details.dart';

class OrderDetails extends Equatable {
  final OrderDetails? orderDetails;
  final OrderData? order;
  final List<Pharmaceutical>? pharmaceuticals;

  const OrderDetails( {this.order,this.orderDetails, this.pharmaceuticals});

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
order: json['order']== null
            ? null
            : OrderData.fromJson(json['order'] as Map<String, dynamic>),
        orderDetails: json['order'] == null
            ? null
            : OrderDetails.fromJson(json['order'] as Map<String, dynamic>),
        pharmaceuticals: (json['pharmaceuticals'] as List<dynamic>?)
            ?.map((e) => Pharmaceutical.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        
        'order': orderDetails?.toJson(),
        'pharmaceuticals': pharmaceuticals?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [orderDetails, pharmaceuticals,order];
}
