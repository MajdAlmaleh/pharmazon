class DateModel {
 // final int? DateId;
   String? date;
   DateModel({ this.date});

  Map<String, dynamic> toJson() => {
        'date': date,
       // 'DateName': DateName,
      };
  factory DateModel.fromJson(Map<String, dynamic> json) =>DateModel (
       date: json['date'],
      // DateName:json['DateName'] ,
  );
}
