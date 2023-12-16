import 'package:equatable/equatable.dart';

class OrderData extends Equatable {
	final int? orderId;
 final String? status;
 final String? payment; 
	final String? date;
	const OrderData({this.orderId, this.status, this.payment, this.date, 
	
	});

	factory OrderData.fromJson(Map<String, dynamic> json) {
		return OrderData(
	 orderId:  json['order_id' 
    ] as int?,
			date: json['Date'] as String?,
				payment:  json['payment'] as String?,
        status:  json['status'] as String?,
	
		);
	}



	Map<String, dynamic> toJson() => {
				
	'order_id':orderId,
				'Date': date,
        'payment':payment,
        'status':status,
			
			};

	@override
	List<Object?> get props {
		return [
			
				date,
				orderId,
        status,
        payment,
		];
	}
}
