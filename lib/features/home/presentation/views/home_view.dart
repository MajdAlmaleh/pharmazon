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

class _HomeViewState extends State<HomeView>with SingleTickerProviderStateMixin {
  final List<Widget> _pages = [
    const HomeViewBody(),
    const SearchViewBody(),
    const OrdersViewBody(),
    const SettingsViewBody()
  ];
  int activeIndex = 0;
  late TabController controller;

   @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: 4);
  }

  // @override
  // void dispose() {
  //   controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (activeIndex != 0) {
          setState(() {
            activeIndex = 0;
            controller.animateTo(0); // Add this line
          });
          return false; // Prevent the route from being popped
        }
        return true; // Allow the route to be popped
      },
      child: Scaffold(
        bottomNavigationBar: ConvexAppBar(
          height: 54,
          backgroundColor: kAppColor,
          color: Colors.white,
          initialActiveIndex: 0,
          controller: controller, // Add this line
          items: [
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
          title: Text(S.of(context).pharmazon),
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
        body: _pages[activeIndex],
      ),
    );
  }
}
