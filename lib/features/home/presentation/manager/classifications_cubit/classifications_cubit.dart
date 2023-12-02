import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon/core/shared_models/classifications_model.dart';
import 'package:pharmazon/features/home/data/repos/home_repo.dart';

part 'classifications_state.dart';

class ClassificationsCubit extends Cubit<ClassificationsState> {
  final HomeRepo homeRepo;
  ClassificationsCubit(this.homeRepo) : super(ClassificationsInitial());

  Future<void> fetchClassifications() async {
    emit(ClassificationsLoading());

    final result = await homeRepo.fetchClassifications();

    result.fold((failure) {
      emit(ClassificationsFailure(errMessage: failure.errMessage));
    }, (classifications) {
      emit(ClassificationsSuccess(classifications));
    });
  }
}
