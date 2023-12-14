part of 'dates_cubit.dart';

sealed class DatesState extends Equatable {
  const DatesState();

  @override
  List<Object> get props => [];
}

final class DatesInitial extends DatesState {}

final class DatesLoading extends DatesState {}

final class DatesFailure extends DatesState {
  final String errMessage;
  const DatesFailure({required this.errMessage});
}

final class DatesSuccess extends DatesState {
  final List<DateModel> dates;

  const DatesSuccess(this.dates);
}
