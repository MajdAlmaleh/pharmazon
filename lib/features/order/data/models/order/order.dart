import 'package:equatable/equatable.dart';

class OrderData extends Equatable {
  final int? orderId;
  final String? status;
  final String? payment; 
  final String? date;
  final double? totalPrice;
  final int? userId; // Added userId

  const OrderData({
    this.orderId, 
    this.status, 
    this.payment, 
    this.date,
    this.totalPrice,
    this.userId, // Added userId
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      orderId: json['order_id'] as int?,
      date: json['Date'] as String?,
      payment: json['payment'] as String?,
      status: json['status'] as String?,
      totalPrice: json['total_price'] as double?,
      userId: json['user_id'] as int?, // Added userId
    );
  }

  Map<String, dynamic> toJson() => {
    'order_id': orderId,
    'Date': date,
    'payment': payment,
    'status': status,
    'total_price': totalPrice,
    'user_id': userId, // Added userId
  };

  @override
  List<Object?> get props {
    return [
      date,
      orderId,
      status,
      payment,
      totalPrice,
      userId, // Added userId
    ];
  }
}
