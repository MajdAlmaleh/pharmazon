import 'package:flutter/material.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';
import 'package:pharmazon/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pharmazon/generated/l10n.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only( right: 10, left: 10,bottom: 40),
      child: AuthTextField(
        textInputType: TextInputType.text,
        prefixIcon: const Icon(
          Icons.medical_information,
          color: kAppColor,
        ),
        phoneNumberValidator:(value) => usernameValidator!(value, context) ,
        onSave: (newValue) {
          username = newValue!;
        },
        formatter: usernameFormatter,
        hintText:  S.of(context).enterYourUsername,
      ),
    );
  }
}
