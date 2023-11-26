import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

final formKey = GlobalKey<FormState>();
late String phoneNumber;
late String password;
late String username;
late bool isSignIn;

void Function(String? newValue)? save = (newValue) {};

String? Function(String?)? phoneNumberValidator = (value) {
  if (value == null ||
      value.isEmpty ||
      value.trim().length < 10 ||
      value[0] != '0' ||
      value[1] != '9') {
    return 'Phone number should be 10 digits and start with 09';
  }
  return null;
};
String? Function(String?)? usernameValidator = (value) {
  if (value == null || value.trim().isEmpty || value.trim().length < 4) {
    return 'Username should be at lest 10 characters';
  }
  return null;
};
String? Function(String?)? passwordValidator = (value) {
  if (value == null || value.trim().isEmpty || value.trim().length < 8) {
    return 'Password should be at lest 8 characters';
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
