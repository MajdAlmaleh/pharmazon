import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/core/widgets/medicine_bubble.dart';
import 'package:pharmazon/features/search/presentation/manager/commercial_name_cubit/commercial_name_search_cubit.dart';

class CommercialNameSearchItems extends StatelessWidget {
  const CommercialNameSearchItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommercialNameSearchCubit, CommercialNameSearchState>(
      builder: (context, state) {
        if (state is CommercialNameSearchLoading) {
          return const CustomLoading();
        }
        if (state is CommercialNameSearchFailure) {
          return CustomError(errMessage: state.errMessage);
        }
        if (state is CommercialNameSearchSuccess) {
          return Expanded(
            child: ListView.builder(
              itemCount: state.medicines.length,
              itemBuilder: (context, index) {
                return MedicineBubble(
                  medicineModel: state.medicines[index],
                );
              },
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
