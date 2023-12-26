import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/features/order/presentation/views/widgets/orders_view_body.dart';
import 'package:pharmazon/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:pharmazon/features/settings/presentation/views/widgets/settings_view_body.dart';
import 'package:pharmazon/generated/l10n.dart';

import 'widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> _pages = [
    const HomeViewBody(),
    const SearchViewBody(),
    const OrdersViewBody(),
    const SettingsViewBody()
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        height: 54,
        backgroundColor: kAppColor,
        color:  Colors.white,
        initialActiveIndex: 0,
        items:  [
          TabItem(icon: Icons.home, title: S.of(context).home),
          TabItem(icon: Icons.search, title: S.of(context).search),
          TabItem(icon: Icons.shopping_cart, title: S.of(context).orders),
            TabItem(icon: Icons.settings, title: S.of(context).settings),
        ],
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      appBar: AppBar(
        title:  Text(S.of(context).pharmazon),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              context.push(AppRouter.kFavoritesView);
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.push(AppRouter.kOrderView);
            },
          ),
        ],
      ),
      // // //  drawer: const HomeDrawrer(),
      body: _pages[activeIndex],
    );
  }
}
