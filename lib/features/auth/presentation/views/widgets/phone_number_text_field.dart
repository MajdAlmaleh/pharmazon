import 'package:flutter/material.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';
import 'package:pharmazon/features/auth/presentation/views/widgets/auth_text_field.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      textInputType: TextInputType.number,
      phoneNumberValidator: phoneNumberValidator,
      prefixIcon: const Icon(
        Icons.phone,
        color: Color(0xFF2AEBA4),
      ),
      onSave: (newValue) {
        phoneNumber = newValue!;
      },
      formatter: phoneFormatter,
      hintText: "Enter your phone number",
    );
  }
}
