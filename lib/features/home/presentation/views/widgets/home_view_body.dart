import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/widgets/classifications_grid_view.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon/generated/l10n.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TokenCubit>(context).fetchSavedToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          BlocBuilder<ClassificationsCubit, ClassificationsState>(
            builder: (context, state) {
              if (state is ClassificationsLoading) {
                //todo make shimmer
                return const CustomLoading();
              }
              if (state is ClassificationsSuccess) {
                return Expanded(
                  child: LiquidPullToRefresh(
                    color: kAppColor,
                    onRefresh: () async {
                     await BlocProvider.of<ClassificationsCubit>(context)
                          .fetchClassifications();
                    },
                    child: ClassificationsGridView(
                      classifications: state.classifications,
                    ),
                  ),
                );
              }
              if (state is ClassificationsFailure) {
                return CustomError(errMessage: state.errMessage);
              }

              return  Expanded(child: Text(S.of(context).ThereIsNoMedicines)

          
                  );
            },
          ),
        ],
      ),
    );
  }
}
