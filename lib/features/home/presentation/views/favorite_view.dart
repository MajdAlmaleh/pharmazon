import 'package:flutter/material.dart';
import 'package:pharmazon/features/home/presentation/views/widgets/home_drawrer.dart';

import 'widgets/favorites_view_body.dart';

class FavoraitesView extends StatelessWidget {
  const FavoraitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoraites'),
      ),
      body: const FavoritesViewBody(),
    );
  }
}
