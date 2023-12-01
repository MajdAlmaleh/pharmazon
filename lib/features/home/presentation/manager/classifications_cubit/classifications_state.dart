part of 'classifications_cubit.dart';

sealed class ClassificationsState extends Equatable {
  const ClassificationsState();

  @override
  List<Object> get props => [];
}

final class ClassificationsInitial extends ClassificationsState {}

final class ClassificationsLoading extends ClassificationsState {}

final class ClassificationsFailure extends ClassificationsState {
  final String errMessage;
  const ClassificationsFailure({required this.errMessage});
}

final class ClassificationsSuccess extends ClassificationsState {
  final List<ClassificationsModel> classifications;

  const ClassificationsSuccess(this.classifications);
}
