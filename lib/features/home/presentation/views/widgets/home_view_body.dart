import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/widgets/auth_button.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon/generated/l10n.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AuthButton(
                onPressed: () async {
                  await HomeRepoImpl().logOut();
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
      ),
    );
  }
}
