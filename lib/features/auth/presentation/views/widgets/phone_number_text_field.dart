import 'package:flutter/material.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';
import 'package:pharmazon/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:pharmazon/generated/l10n.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      textInputType: TextInputType.number,
      phoneNumberValidator: (value) => phoneNumberValidator!(value, context) ,
      prefixIcon: const Icon(
        Icons.phone,
        color: kAppColor,
      ),
      onSave: (newValue) {
        phoneNumber = newValue!;
      },
      formatter: phoneFormatter,
      hintText: S.of(context).enterYourPhoneNumber ,
    );
  }
}
