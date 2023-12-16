import 'package:equatable/equatable.dart';

class Pivot extends Equatable {
  final int? orderId;
  final int? pharmaceuticalId;
  final int? quantity;
  final String? status;
  final String? payment;

  const Pivot( {this.status, this.payment,this.orderId, this.pharmaceuticalId, this.quantity});

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(

        orderId: json['order_id'] as int?,
        pharmaceuticalId: json['pharmaceutical_id'] as int?,
        quantity: json['quantity'] as int?,
        status: json['status'] as String?,
        payment: json['payment'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'order_id': orderId,
        'pharmaceutical_id': pharmaceuticalId,
        'quantity': quantity,
        'status':status,
        'payment':payment,
      };

  @override
  List<Object?> get props => [orderId, pharmaceuticalId, quantity,status,payment];
}
