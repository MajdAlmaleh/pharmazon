import 'package:equatable/equatable.dart';

class Pivot extends Equatable {
	final int? orderId;
	final int? pharmaceuticalId;
	final int? quantity;

	const Pivot({this.orderId, this.pharmaceuticalId, this.quantity});

	factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
				orderId: json['order_id'] as int?,
				pharmaceuticalId: json['pharmaceutical_id'] as int?,
				quantity: json['quantity'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'order_id': orderId,
				'pharmaceutical_id': pharmaceuticalId,
				'quantity': quantity,
			};

	@override
	List<Object?> get props => [orderId, pharmaceuticalId, quantity];
}
