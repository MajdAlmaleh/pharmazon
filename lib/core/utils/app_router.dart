import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo_impl.dart';
import 'package:pharmazon/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon/features/auth/presentation/views/auth_view.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon/features/home/presentation/manager/classifications_cubit/classifications_cubit.dart';
import 'package:pharmazon/features/home/presentation/manager/medicine_from_class_cubit/medicine_from_class_cubit.dart';
import 'package:pharmazon/features/home/presentation/views/home_view.dart';
import 'package:pharmazon/features/welcome/views/welcome_view.dart';

abstract class AppRouter {
  static const kWelcomeView = '/welcomeView';
  static const kAuthView = '/authView';
  static const kHomeView = '/HomeView';

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
          builder: (context, state) =>MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) =>  ClassificationsCubit(getIt<HomeRepoImpl>())..fetchClassifications()),
      BlocProvider(create: (context) => MedicineFromClassCubit(getIt<HomeRepoImpl>()))
    ],
    child:const HomeView()) 
        ),
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
        builder: (context, state) =>MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) =>  ClassificationsCubit(getIt<HomeRepoImpl>())..fetchClassifications()),
      BlocProvider(create: (context) => MedicineFromClassCubit(getIt<HomeRepoImpl>()))
    ],
    child:const HomeView())  
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
  //   GoRoute(
  //     path: kHomeView,
  //     builder: (context, state) => const HomeView(),
  //   ),
  // ]);
}
