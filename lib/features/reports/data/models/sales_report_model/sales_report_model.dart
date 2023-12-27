import 'package:equatable/equatable.dart';

import 'order.dart';

class SalesReportModel extends Equatable {
	final int? totalPaid;
	final List<Order>? orders;

	const SalesReportModel({this.totalPaid, this.orders});

	factory SalesReportModel.fromJson(Map<String, dynamic> json) {
		return SalesReportModel(
			totalPaid: json['total_paid'] as int?,
			orders: (json['orders'] as List<dynamic>?)
						?.map((e) => Order.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'total_paid': totalPaid,
				'orders': orders?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [totalPaid, orders];
}
