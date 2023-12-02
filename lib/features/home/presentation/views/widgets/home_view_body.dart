import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/core/widgets/auth_button.dart';
import 'package:pharmazon/core/widgets/custom_error.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';
import 'package:pharmazon/generated/l10n.dart';

import '../../../../auth/presentation/views/widgets/classification_item.dart';

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
          AuthButton(
              onPressed: () async {
                await HomeRepoImpl(getIt<ApiService>()).logOut();
                // ignore: use_build_context_synchronously
                GoRouter.of(context).go(AppRouter.kWelcomeView);
              },
              text: 'logout'),
          AuthButton(
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              text: 'search'),
          BlocBuilder<ClassificationsCubit, ClassificationsState>(
            builder: (context, state) {
              if (state is ClassificationsLoading) {
                //todo make shimmer
                return const CustomLoading();
              }
              if (state is ClassificationsSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.classifications.length,
                    itemBuilder: (context, index) {
                      return ClassificationItem(
                          classificotionName:
                              state.classifications[index].clssification!);
                    },
                  ),
                );
              }
              if (state is ClassificationsFailure) {
                return CustomError(errMessage: state.errMessage);
              }

              return Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AuthButton(
                        onPressed: () async {
                          await HomeRepoImpl(getIt<ApiService>()).logOut();
                          // ignore: use_build_context_synchronously
                          GoRouter.of(context).go(AppRouter.kWelcomeView);
                        },
                        text: 'logout'),
                    AuthButton(
                        onPressed: () async {
                          BlocProvider.of<LanguageCubit>(context)
                              .changeLanguage();
                        },
                        text: S.of(context).language),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<MedicineFromClassCubit, MedicineFromClassState>(
            builder: (context, state) {
              if (state is MedicineFromClassLoading) {
                return const CustomLoading();
              }
              if (state is MedicineFromClassFailure) {
                return CustomError(
                  errMessage: state.errMessage,
                );
              }
              if (state is MedicineFromClassSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.medicineFromClass.length,
                    itemBuilder: (context, index) {
                      return ClassificationItem(
                          classificotionName:
                              state.medicineFromClass[index].commercialName!);
                    },
                  ),
                );
              }
              return Text('dallllllllllllllllllllta');
            },
          ),
        ],
      ),
    );
  }
}
