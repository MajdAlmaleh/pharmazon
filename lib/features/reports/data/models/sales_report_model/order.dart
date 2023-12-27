import 'package:equatable/equatable.dart';

class Order extends Equatable {
	final int? id;
	final int? userId;
	final String? status;
	final String? payment;
	final String? totalePrice;
	final DateTime? createdAt;
	final DateTime? updatedAt;

	const Order({
		this.id, 
		this.userId, 
		this.status, 
		this.payment, 
		this.totalePrice, 
		this.createdAt, 
		this.updatedAt, 
	});

	factory Order.fromJson(Map<String, dynamic> json) => Order(
				id: json['id'] as int?,
				userId: json['user_id'] as int?,
				status: json['status'] as String?,
				payment: json['payment'] as String?,
				totalePrice: json['totale_price'] as String?,
				createdAt: json['created_at'] == null
						? null
						: DateTime.parse(json['created_at'] as String),
				updatedAt: json['updated_at'] == null
						? null
						: DateTime.parse(json['updated_at'] as String),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user_id': userId,
				'status': status,
				'payment': payment,
				'totale_price': totalePrice,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
			};

	@override
	List<Object?> get props {
		return [
				id,
				userId,
				status,
				payment,
				totalePrice,
				createdAt,
				updatedAt,
		];
	}
}
