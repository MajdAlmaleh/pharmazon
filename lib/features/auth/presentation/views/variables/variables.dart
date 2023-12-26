import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:pharmazon/generated/l10n.dart';

final formKey = GlobalKey<FormState>();
late String phoneNumber;
late String password;
late String username;
late bool isSignIn;
  

void Function(String? newValue)? save = (newValue) {};

String? Function(String?, BuildContext)? phoneNumberValidator = (value, context) {
  if (value == null ||
      value.isEmpty ||
      value.trim().length < 10 ||
      value[0] != '0' ||
      value[1] != '9') {
    return S.of(context).phoneNumberShouldBe10DigitsAndStartWith09;
  }
  return null;
};

String? Function(String?, BuildContext)? usernameValidator = (value, context) {
  if (value == null || value.trim().isEmpty || value.trim().length < 4) {
    return S.of(context).usernameShouldBeAtLest10Characters;
  }
  return null;
};
String? Function(String?, BuildContext)? passwordValidator = (value, context) {
  if (value == null || value.trim().isEmpty || value.trim().length < 8) {
    return S.of(context).passwordShouldBeAtLest8Characters;
  }
  return null;
};

List<TextInputFormatter>? phoneFormatter = <TextInputFormatter>[
  FilteringTextInputFormatter.digitsOnly,
  LengthLimitingTextInputFormatter(10),
];
List<TextInputFormatter>? usernameFormatter = <TextInputFormatter>[
  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
  LengthLimitingTextInputFormatter(25),
];
List<TextInputFormatter>? passwordFormatter = <TextInputFormatter>[
  LengthLimitingTextInputFormatter(20),
];

void Function(String?)? onSave;

bool hidePassword = true;
