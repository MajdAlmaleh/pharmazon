import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pharmazon/core/shared_models/classifications_model.dart';
import 'package:pharmazon/features/search/data/repos/search_repo.dart';

part 'classifications_search_state.dart';

class ClassificationsSearchCubit extends Cubit<ClassificationsSearchState> {
  final SearchRepo searchRepo;
  ClassificationsSearchCubit(this.searchRepo) : super(ClassificationsSearchInitial());


  Future<void> searchByClassifications( {required String classification}) async {
    emit(ClassificationsSearchLoading());

    final result = await searchRepo.searchByClassifications(classification: classification);

    result.fold((failure) {
      emit(ClassificationsSearchFailure(errMessage: failure.errMessage));
    }, (classifications) {
      emit(ClassificationsSearchSuccess(classifications));
    });
  }


}
