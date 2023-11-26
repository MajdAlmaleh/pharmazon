import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/functions/custom_snack_bar.dart';
import 'package:pharmazon/core/widgets/auth_button.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';

import 'auth_text_field.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({
    super.key,
    required this.authType,
  });
  final String authType;
  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  @override
  void initState() {
    isSignIn = widget.authType == kSignIn ? true : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              GoRouter.of(context).push(AppRouter.kHomeView);
            }
            if (state is AuthFailure) {
              customSnackBar(context, state.errMessage);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
             return const CustomLoading();
            }
            return Form(
              key: formKey,
              child: Column(
                children: [
                  if (!isSignIn)
                    AuthTextField(
                      textInputType: TextInputType.text,
                      phoneNumberValidator: usernameValidator,
                      onSave: (newValue) {
                        username = newValue!;
                      },
                      formatter: usernameFormatter,
                      hintText: 'Enter your username',
                    ),
                  AuthTextField(
                    textInputType: TextInputType.number,
                    phoneNumberValidator: phoneNumberValidator,
                    onSave: (newValue) {
                      phoneNumber = newValue!;
                    },
                    formatter: phoneFormatter,
                    hintText: "Enter your numnber phone",
                  ),
                  AuthTextField(
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      phoneNumberValidator: passwordValidator,
                      onSave: (newValue) {
                        password = newValue!;
                      },
                      formatter: passwordFormatter,
                      hintText: "Enter your password"),
                  AuthButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (isSignIn) {
                            BlocProvider.of<AuthCubit>(context)
                                .signInWithEmailAndPassword(
                                    phoneNumber, password);
                          } else {
                            BlocProvider.of<AuthCubit>(context)
                                .signUpWithEmailAndPassword(
                                    phoneNumber, password, username);
                          }
                        }
                      },
                      text: isSignIn ? 'Sign In' : 'Sign Up'),
                  const Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      "Do not have an account ?",
                      style:
                          TextStyle(color: Color(0xFF8BEF15), fontSize: (20)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
