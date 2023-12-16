import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon/features/order/presentation/manager/cart_cubit/cart_cubit.dart';

class HomeDrawrer extends StatelessWidget {
  final String? pageName;
  const HomeDrawrer({
    super.key,
    this.pageName,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF17C381),
              width: double.infinity,
              height: 300,
              child: Container(
                color: const Color(0xFF17C381),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();

                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              leading: const Icon(
                Icons.search,
              ),
              title: const Text(
                'Search',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text(
                'Setting',
                style: TextStyle(fontSize: 15),
              ),
            ),
            if (!BlocProvider.of<CartCubit>(context).checkIfEmpty())
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  if (pageName == 'cart') {
                    return;
                  }
                  context.push(AppRouter.kOrderView);
                  //  HomeRepoImpl(getIt<ApiService>()).logOut();
                },
                leading: const Icon(
                  Icons.shopping_cart,
                ),
                title: const Text(
                  'view cart',
                  style: TextStyle(fontSize: 15),
                ),
              ),



         ListTile(
            leading: const Icon(
              Icons.shopping_cart_checkout,
            ),
            title: const Text(
              'My Orders',
              style: TextStyle(fontSize: 15),
            ),
            onTap: () {
             context.go(AppRouter.kOrdersView); 
            },
          ),


            ListTile(
              onTap: () {
                GoRouter.of(context).go(AppRouter.kWelcomeView);
                HomeRepoImpl(getIt<ApiService>()).logOut();
              },
              leading: const Icon(
                Icons.logout,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
