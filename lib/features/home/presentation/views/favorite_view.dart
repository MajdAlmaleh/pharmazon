import 'package:flutter/material.dart';
import 'package:pharmazon/generated/l10n.dart';

import 'widgets/favorites_view_body.dart';

class FavoraitesView extends StatelessWidget {
  const FavoraitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).favoraites),
      ),
      body: const FavoritesViewBody(),
    );
  }
}
