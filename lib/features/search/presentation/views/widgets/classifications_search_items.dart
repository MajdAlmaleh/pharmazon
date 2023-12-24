import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/classifications_grid_view.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/search/presentation/manager/Classifications_search_cubit/classifications_search_cubit.dart';

class ClassificationsSearchItems extends StatelessWidget {
  const ClassificationsSearchItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassificationsSearchCubit, ClassificationsSearchState>(
      builder: (context, state) {
        if (state is ClassificationsSearchLoading) {
          return const CustomLoading();
        }
        if (state is ClassificationsSearchFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is ClassificationsSearchSuccess) {
          return Expanded(
            child:
                ClassificationsGridView(classifications: state.classifications),
          );
        }
        return const SizedBox();
      },
    );
  }
}
