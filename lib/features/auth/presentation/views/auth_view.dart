import 'package:flutter/material.dart';

import 'widgets/auth_view_body.dart';

class AuthView extends StatelessWidget {
  const AuthView({
    super.key,
    required this.authType,
  });
  final String authType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthViewBody(
        authType: authType,
      ),
    );
  }
}
