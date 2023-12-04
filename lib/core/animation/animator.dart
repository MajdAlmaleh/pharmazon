import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideRightTransitionPage extends CustomTransitionPage {
  SlideRightTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
          key: key,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin:const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          child: child,
        );
}