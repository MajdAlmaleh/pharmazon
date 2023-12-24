import 'package:equatable/equatable.dart';

import 'pivot.details.dart';

class Pharmaceutical extends Equatable {
  final int? id;
  final String? scientificName;
  final String? commercialName;
  final String? calssification;
  final String? manufactureCompany;
  final int? quantityAvailable;
  final String? expireDate;
  final int? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;
  final bool? isFavorite;

  const Pharmaceutical({
    this.id, 
    this.scientificName, 
    this.commercialName, 
    this.calssification, 
    this.manufactureCompany, 
    this.quantityAvailable, 
    this.expireDate, 
    this.price, 
    this.createdAt, 
    this.updatedAt, 
    this.pivot,
    this.isFavorite,
  });

  factory Pharmaceutical.fromJson(Map<String, dynamic> json) {
    return Pharmaceutical(
      id: json['id'] as int?,
      scientificName: json['scientific_name'] as String?,
      commercialName: json['commercial_name'] as String?,
      calssification: json['calssification'] as String?,
      manufactureCompany: json['manufacture_company'] as String?,
      quantityAvailable: json['quantity_available'] as int?,
      expireDate: json['expire_date'] as String?,
      price: json['price'] as int?,
      createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      pivot: json['pivot'] == null
            ? null
            : Pivot.fromJson(json['pivot'] as Map<String, dynamic>),
      isFavorite: json['is_favorite'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'scientific_name': scientificName,
    'commercial_name': commercialName,
    'calssification': calssification,
    'manufacture_company': manufactureCompany,
    'quantity_available': quantityAvailable,
    'expire_date': expireDate,
    'price': price,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'pivot': pivot?.toJson(),
    'is_favorite': isFavorite,
  };

  @override
  List<Object?> get props {
    return [
      id,
      scientificName,
      commercialName,
      calssification,
      manufactureCompany,
      quantityAvailable,
      expireDate,
      price,
      createdAt,
      updatedAt,
      pivot,
      isFavorite,
    ];
  }
}
