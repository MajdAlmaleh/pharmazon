import 'package:flutter/material.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';
import 'package:pharmazon/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pharmazon/generated/l10n.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.viewPasswordState,
  });
  final void Function() viewPasswordState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 10, left: 10, bottom: 40),
      child: AuthTextField(
          obscureText: hidePassword,
          prefixIcon: const Icon(
            Icons.password,
            color: kAppColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              hidePassword ? Icons.visibility_off : Icons.visibility,
              color: kAppColor,
            ),
            onPressed: viewPasswordState,
          ),
          textInputType: TextInputType.visiblePassword,
          phoneNumberValidator: (value) => passwordValidator!(value, context),
          onSave: (newValue) {
            password = newValue!;
          },
          formatter: passwordFormatter,
          hintText: S.of(context).enterYourPassword),
    );
  }
}
