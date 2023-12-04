import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmazon/core/widgets/auth_button.dart';
import 'package:pharmazon/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon/features/auth/presentation/views/variables/variables.dart';

class SignButton extends StatelessWidget {
  const SignButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: AuthButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            if (isSignIn) {
              BlocProvider.of<AuthCubit>(context)
                  .signInWithEmailAndPassword(phoneNumber, password);
            } else {
              BlocProvider.of<AuthCubit>(context)
                  .signUpWithEmailAndPassword(phoneNumber, password, username);
            }
          }
        },
        text: isSignIn ? 'Sign In' : 'Sign Up',
      ),
    );
  }
}
