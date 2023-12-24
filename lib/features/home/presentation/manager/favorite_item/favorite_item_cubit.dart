import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon/features/home/data/repos/home_repo.dart';
import 'package:pharmazon/features/order/data/models/order/pharmaceutical.details.dart';

part 'favorite_item_state.dart';

class FavoriteItemCubit extends Cubit<FavoriteItemState> {
  final HomeRepo homeRepo;
  FavoriteItemCubit(this.homeRepo) : super(FavoriteItemInitial());

  Future<void> changeFavoriteState({
    required String id,
  }) async {
    final result = await homeRepo.changeFavoriteState(id: id);
    result.fold((failure) {
      emit(FavoriteItemFailure(errMessage: failure.errMessage));
    }, (success) {
      
    });
  }
  Future<void> getFavoriteItems()
   async {
    emit(FavoriteItemLoading());

    final result = await homeRepo.getFavoriteItems();
    result.fold((failure) {
      emit(FavoriteItemFailure(errMessage: failure.errMessage));
    }, (success) {
      emit(FavoriteItemSuccess(success));
    });
  }
}
