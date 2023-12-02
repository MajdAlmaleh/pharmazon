part of 'classifications_search_cubit.dart';

sealed class ClassificationsSearchState extends Equatable {
  const ClassificationsSearchState();

  @override
  List<Object> get props => [];
}

final class ClassificationsSearchInitial extends ClassificationsSearchState {}
final class ClassificationsSearchLoading extends ClassificationsSearchState {}

final class ClassificationsSearchFailure extends ClassificationsSearchState {
  final String errMessage;
  const ClassificationsSearchFailure({required this.errMessage});
}

final class ClassificationsSearchSuccess extends ClassificationsSearchState {
  final List<ClassificationsModel> classifications;

  const ClassificationsSearchSuccess(this.classifications);
}
