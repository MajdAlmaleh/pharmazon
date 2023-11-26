import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/assets.dart';
import 'package:pharmazon/generated/l10n.dart';

import '../../../../core/widgets/auth_button.dart';

class WelcomeViewBody extends StatelessWidget {
  const WelcomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AssetsData.logo,
            ),
            // SvgPicture.asset(
            //   'assets/images/logo.png',
            //   height: MediaQuery.of(context).size.width,
            //   // width: 800,
            // )
            Text(
              S.of(context).title,
              style: const TextStyle(fontSize: 20),
            ),
            AuthButton(
                onPressed: () {
                  GoRouter.of(context)
                      .push(AppRouter.kAuthView, extra: kSignIn);
                },
                text: kSignIn),
            const SizedBox(
              height: 20,
            ),
            AuthButton(
                onPressed: () {
                  GoRouter.of(context)
                      .push(AppRouter.kAuthView, extra: kSignUp);
                },
                text: kSignUp),
          ],
        ),
      ),
    );
  }
}
