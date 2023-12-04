import 'package:flutter/material.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';
import 'package:pharmazon/features/auth/presentation/views/widgets/auth_text_field.dart';

class UsernameTextField extends StatelessWidget {
  const UsernameTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 120, right: 10, left: 10),
      child: AuthTextField(
        textInputType: TextInputType.text,
        prefixIcon: const Icon(
          Icons.medical_information,
          color: Color(0xFF2AEBA4),
        ),
        phoneNumberValidator: usernameValidator,
        onSave: (newValue) {
          username = newValue!;
        },
        formatter: usernameFormatter,
        hintText: 'Enter your username',
      ),
    );
  }
}
