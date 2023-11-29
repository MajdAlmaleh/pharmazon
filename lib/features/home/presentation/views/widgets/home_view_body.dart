import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon/blocs/token_cubit/token_cubit.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/core/widgets/auth_button.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo_impl.dart';
import 'package:pharmazon/features/home/data/repos/home_repo.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
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
    // TODO: implement initState
    super.initState();
    BlocProvider.of<TokenCubit>(context).fetchSavedToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AuthButton(
                // onPressed: () async {
                //   await HomeRepoImpl(getIt<ApiService>()).logOut(token: BlocProvider.of<TokenCubit>(context).state!);
                //   // ignore: use_build_context_synchronously
                //   GoRouter.of(context).go(AppRouter.kWelcomeView);
                // },
                onPressed: () async {
                  await HomeRepoImpl(getIt<ApiService>()).fetchClassifications(
                      token: BlocProvider.of<TokenCubit>(context).state!);
                  // ignore: use_build_context_synchronously
                  // GoRouter.of(context).go(AppRouter.kWelcomeView);
                },
                text: 'logout'),
            AuthButton(
                onPressed: () async {
                  BlocProvider.of<LanguageCubit>(context).changeLanguage();
                },
                text: S.of(context).language),
          ],
        ),
      ),
    );
  }
}
