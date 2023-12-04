import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/functions/custom_snack_bar.dart';
import 'package:pharmazon/core/widgets/custom_loading.dart';
import 'package:pharmazon/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';

import 'password_text_field.dart';
import 'phone_number_text_field.dart';
import 'sign_button.dart';
import 'username_text_field.dart';

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
      child: BlocConsumer<AuthCubit, AuthState>(
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
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  isSignIn ? 'Sign In' : 'Sign Up',
                  style: const TextStyle(color: Colors.white, fontSize: 60),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            if (!isSignIn) const UsernameTextField(),
                            const PhoneNumberTextField(),
                            PasswordTextField(viewPasswordState: () {
                              setState(() {
                                viewPassword = !viewPassword;
                              });
                            }),
                            const SignButton(),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 50,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Do not have an account ?",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSignIn = !isSignIn;
                                        formKey.currentState!.reset();
                                      });
                                    },
                                    child: Text(
                                      isSignIn ? 'Sign In' : 'Sign Up',
                                      style: const TextStyle(
                                          color: Colors.green, fontSize: 20),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
