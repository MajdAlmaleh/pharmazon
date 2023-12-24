part of 'medicine_from_class_cubit.dart';

sealed class MedicineFromClassState extends Equatable {
  const MedicineFromClassState();

  @override
  List<Object> get props => [];
}

final class MedicineFromClassInitial extends MedicineFromClassState {}
final class MedicineFromClassLoading extends MedicineFromClassState {}

final class MedicineFromClassFailure extends MedicineFromClassState {
  final String errMessage;
  const MedicineFromClassFailure({required this.errMessage});
}

final class MedicineFromClassSuccess extends MedicineFromClassState {
  final List<Pharmaceutical> medicineFromClass;

  const MedicineFromClassSuccess(this.medicineFromClass);
}
