import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/shared_models/medicine_model.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo_impl.dart';
import 'package:pharmazon/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon/features/auth/presentation/views/auth_view.dart';
import 'package:pharmazon/core/widgets/medicine_details.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';
import 'package:pharmazon/features/home/presentation/views/home_view.dart';
import 'package:pharmazon/features/home/presentation/views/medicines_view.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';
import 'package:pharmazon/features/order/data/repos/order_repo_impl.dart';
import 'package:pharmazon/features/order/presentation/manager/dates_cubit/dates_cubit.dart';
import 'package:pharmazon/features/order/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:pharmazon/features/order/presentation/views/order_details_view.dart';
import 'package:pharmazon/features/order/presentation/views/order_view.dart';
import 'package:pharmazon/features/order/presentation/views/orders_view.dart';
import 'package:pharmazon/features/search/data/repos/search_repo_impl.dart';
import 'package:pharmazon/features/search/presentation/manager/Classifications_search_cubit/classifications_search_cubit.dart';
import 'package:pharmazon/features/search/presentation/manager/commercial_name_cubit/commercial_name_search_cubit.dart';
import 'package:pharmazon/features/search/presentation/views/search_view.dart';
import 'package:pharmazon/features/welcome/views/welcome_view.dart';

abstract class AppRouter {
  static const kWelcomeView = '/welcomeView';
  static const kAuthView = '/authView';
  static const kHomeView = '/homeView';
  static const kMedicinesView = '/medicinesView';
  static const kSearchView = '/searchView';
  static const kMedicineDetail = '/medicineDetail';
  static const kOrderView = '/orderView';
  static const kOrdersView = '/ordersView';
  static const kOrderDetailsFromDate = '/orderDetailsFromDate';

  static GoRouter setupRouter(String? token) {
    // Create storage

    return GoRouter(routes: [
      if (token == null)
        GoRoute(
          path: '/',
          builder: (context, state) => const WelcomeView(),
        ),
      if (token != null)
        GoRoute(
            path: '/',
            builder: (context, state) => MultiBlocProvider(providers: [
                  BlocProvider(
                      create: (context) =>
                          ClassificationsCubit(getIt<HomeRepoImpl>())
                            ..fetchClassifications()),
                  BlocProvider(
                    create: (context) =>
                        MedicineFromClassCubit(getIt<HomeRepoImpl>()),
                  ),
                ], child: const HomeView())),
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) => const WelcomeView(),
      ),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(getIt<AuthRepoImpl>()),
          child: AuthView(
            authType: state.extra as String,
          ),
        ),
      ),
      GoRoute(
          path: kHomeView,
          builder: (context, state) => MultiBlocProvider(providers: [
                BlocProvider(
                    create: (context) =>
                        ClassificationsCubit(getIt<HomeRepoImpl>())
                          ..fetchClassifications()),
                BlocProvider(
                    create: (context) =>
                        MedicineFromClassCubit(getIt<HomeRepoImpl>())),
              ], child: const HomeView())),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ClassificationsSearchCubit(
                getIt<SearchRepoImpl>(),
              ),
            ),
            BlocProvider(
              create: (context) => CommercialNameSearchCubit(
                getIt<SearchRepoImpl>(),
              ),
            ),
          ],
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kMedicineDetail,
        builder: (context, state) => MedicineDetails(
          medicineModel: state.extra as MedicineModel,
        ),
      ),
      GoRoute(
        path: kMedicinesView,
        builder: (context, state) => BlocProvider(
          create: (context) => MedicineFromClassCubit(getIt<HomeRepoImpl>()),
          child: MedicinesView(classificationName: state.extra as String),
        ),
      ),
      GoRoute(path: kOrderView, builder: (context, state) => const OrderView()),
      GoRoute(
        path: kOrdersView,
        builder: (context, state) => BlocProvider(
          //TODO here make it from the token or from fetching via token
          create: (context) => DatesCubit(getIt<OrderRepoImpl>())
            ..fetchDateFromUser(),
          child: const  OrdersView(),
        ),
      ),
      GoRoute(
        path: kOrderDetailsFromDate,
        builder: (context, state) => BlocProvider(
          create: (context) => OrderDetailsCubit(getIt<OrderRepoImpl>())
            ..fetchOrderDetailsFromDate(dateModel: state.extra as DateModel),
          child: OrderDetailsView(
            dateModel: state.extra as DateModel,
          ),
        ),
      ),
    ]);
  }

  // static final router = GoRouter(routes: [
  //   GoRoute(
  //     path: '/',
  //     builder: (context, state) => const WelcomeView(),
  //   ),
  //   GoRoute(
  //     path: kAuthView,
  //     builder: (context, state) => BlocProvider(
  //       create: (context) => AuthCubit(getIt<AuthRepoImpl>()),
  //       child: AuthView(
  //         authType: state.extra as String,
  //       ),
  //     ),
  //   ),
  //   // GoRoute(
  //   //     path: kBookDetailsView,
  //   //     builder: (context, state) => BlocProvider(
  //   //           create: (context) => SimilarBooksCubit(getIt<HomeRepoImpl>()),
  //   //           child: BookDetailsView(
  //   //             bookModel: state.extra as BookModel,
  //   //           ),
  //   //         )),
  // ]);
}
