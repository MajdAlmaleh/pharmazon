import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'widgets/home_drawrer.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('classification'),
       
      ),
      drawer: const HomeDrawrer(),
      body: const HomeViewBody(),
    );
  }
}
