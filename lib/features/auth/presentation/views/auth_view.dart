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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xFF17C381),
              Color(0xFF17C381),
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
