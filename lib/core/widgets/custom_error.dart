import 'package:flutter/widgets.dart';

class CustomError extends StatelessWidget {
  const CustomError({super.key,required this.errMessage});
  final errMessage;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(errMessage),
    );
  }
}
