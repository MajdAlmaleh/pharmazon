import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/core/widgets/medicine_details.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo_impl.dart';
import 'package:pharmazon/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon/features/auth/presentation/views/auth_view.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon/features/home/presentation/manager/favorite_item/favorite_item_cubit.dart';
import 'package:pharmazon/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';
import 'package:pharmazon/features/home/presentation/views/favorite_view.dart';
import 'package:pharmazon/features/home/presentation/views/home_view.dart';
import 'package:pharmazon/features/home/presentation/views/medicines_view.dart';
import 'package:pharmazon/features/order/data/models/date_model.dart';
import 'package:pharmazon/features/order/data/models/order/pharmaceutical.details.dart';
import 'package:pharmazon/features/order/data/repos/order_repo_impl.dart';
import 'package:pharmazon/features/order/presentation/manager/dates_cubit/dates_cubit.dart';
import 'package:pharmazon/features/order/presentation/manager/order_details_cubit/order_details_cubit.dart';
import 'package:pharmazon/features/order/presentation/views/order_details_view.dart';
import 'package:pharmazon/features/order/presentation/views/order_view.dart';
import 'package:pharmazon/features/order/presentation/views/orders_view.dart';
import 'package:pharmazon/features/reports/data/repos/report_repo_impl.dart';
import 'package:pharmazon/features/reports/presentation/manager/sales_cubit/sales_report_cubit.dart';
import 'package:pharmazon/features/reports/presentation/views/sales_report_view.dart';
import 'package:pharmazon/features/search/data/repos/search_repo_impl.dart';
import 'package:pharmazon/features/search/presentation/manager/Classifications_search_cubit/classifications_search_cubit.dart';
import 'package:pharmazon/features/search/presentation/manager/commercial_name_cubit/commercial_name_search_cubit.dart';
import 'package:pharmazon/features/search/presentation/views/search_view.dart';

abstract class AppRouter {
  static const kAuthView = '/authView';
  static const kHomeView = '/homeView';
  static const kMedicinesView = '/medicinesView';
  static const kSearchView = '/searchView';
  static const kMedicineDetail = '/medicineDetail';
  static const kOrderView = '/orderView';
  static const kOrdersView = '/ordersView';
  static const kOrderDetailsFromDate = '/orderDetailsFromDate';
  static const kFavoritesView = '/favoritesView';
    static const kSalesReportFromDate = '/salesReportFromDate';


  static GoRouter setupRouter(String? token) {
    // Create storage

    return GoRouter(routes: [
      if (token == null)
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (context) => AuthCubit(getIt<AuthRepoImpl>()),
            child: const AuthView(authType: kSignIn),
          ),
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
                  BlocProvider(
                    create: (context) =>
                        DatesCubit(getIt<OrderRepoImpl>())..fetchDateFromUser(),
                    child: const OrdersView(),
                  ),
                ], child: const HomeView())),
      GoRoute(
        path: kAuthView,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(getIt<AuthRepoImpl>()),
          child: const AuthView(
            authType: kSignIn,
          ),
        ),
      ),
      GoRoute(
          path: kHomeView,
          builder: (context, state) => MultiBlocProvider(providers: [
                BlocProvider(
                  create: (context) =>
                      DatesCubit(getIt<OrderRepoImpl>())..fetchDateFromUser(),
                  child: const OrdersView(),
                ),
                BlocProvider(
                    create: (context) =>
                        ClassificationsCubit(getIt<HomeRepoImpl>())
                          ..fetchClassifications()),
                BlocProvider(
                    create: (context) =>
                        MedicineFromClassCubit(getIt<HomeRepoImpl>())),
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
          medicineModel: state.extra as Pharmaceutical,
        ),
      ),
      GoRoute(
        /////////////////////////////////
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
          create: (context) =>
              DatesCubit(getIt<OrderRepoImpl>())..fetchDateFromUser(),
          child: const OrdersView(),
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
      GoRoute(
        path: kFavoritesView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              FavoriteItemCubit(getIt<HomeRepoImpl>())..getFavoriteItems(),
          child: const FavoraitesView(),
        ),
      ),
 GoRoute(
        path: kSalesReportFromDate,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SalesReportCubit(getIt<ReportRepoImpl>())
                ..getSalesReportFromDate(
                    month: int.parse((state.extra as String).split('/')[0]),
                    year: int.parse((state.extra as String).split('/')[1])),
            ),
          ],
          child:  SalesReportView(
             date: state.extra as String,
              ),
        ),
      ),

    ]);
  }

}
