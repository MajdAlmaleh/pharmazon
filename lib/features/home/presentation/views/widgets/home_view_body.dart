import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/core/widgets/classifications_grid_view.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';

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
                  child: ClassificationsGridView(
                    classifications: state.classifications,
                  ),
                );
              }
              if (state is ClassificationsFailure) {
                return CustomError(errMessage: state.errMessage);
              }

              return const Expanded(child: Text('There is no medicines')

                  // AuthButton(
                  //     onPressed: () async {
                  //       BlocProvider.of<LanguageCubit>(context)
                  //           .changeLanguage();
                  //     },
                  //     text: S.of(context).language),

                  );
            },
          ),
     
        ],
      ),
    );
  }
}
