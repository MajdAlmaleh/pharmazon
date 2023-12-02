part of 'commercial_name_search_cubit.dart';

sealed class CommercialNameSearchState extends Equatable {
  const CommercialNameSearchState();

  @override
  List<Object> get props => [];
}

final class CommercialNameSearchInitial extends CommercialNameSearchState {}
final class CommercialNameSearchLoading extends CommercialNameSearchState {}

final class CommercialNameSearchFailure extends CommercialNameSearchState {
  final String errMessage;
  const CommercialNameSearchFailure({required this.errMessage});
}

final class CommercialNameSearchSuccess extends CommercialNameSearchState {
  final List<MedicineModel> medicines;

  const CommercialNameSearchSuccess(this.medicines);
}
