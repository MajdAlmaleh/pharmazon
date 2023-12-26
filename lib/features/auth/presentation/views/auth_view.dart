import 'package:flutter/material.dart';
import 'package:pharmazon/constants.dart';

import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
     this.authType=kSignIn,
  });
  final String authType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
            kAppColor,
              kAppColor,
            ],
          ),
        ),
        child: AuthViewBody(
          authType: authType,
        ),
      ),
    );
  }
}
