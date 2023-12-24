part of 'favorite_item_cubit.dart';

sealed class FavoriteItemState extends Equatable {
  const FavoriteItemState();

  @override
  List<Object> get props => [];
}

final class FavoriteItemInitial extends FavoriteItemState {}

final class FavoriteItemLoading extends FavoriteItemState {}

final class FavoriteItemFailure extends FavoriteItemState {
  final String errMessage;
 const FavoriteItemFailure({required this.errMessage});
}

final class FavoriteItemSuccess extends FavoriteItemState {
   final List<Pharmaceutical> pharmaceutical;
 const  FavoriteItemSuccess(this.pharmaceutical);
}
final class FavoriteItemChangeStateSuccess extends FavoriteItemState {
   final String pharmaceutical;
 const  FavoriteItemChangeStateSuccess(this.pharmaceutical);
}