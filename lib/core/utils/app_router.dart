import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/features/auth/data/repos/auth_repo_impl.dart';
import 'package:pharmazon/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:pharmazon/features/auth/presentation/views/auth_view.dart';
import 'package:pharmazon/features/home/presentation/views/home_view.dart';
import 'package:pharmazon/features/welcome/views/welcome_view.dart';

abstract class AppRouter {
  static const kWelcomeView = '/welcomeView';
  static const kAuthView = '/authView';
  static const kHomeView = '/HomeView';




  static Future<GoRouter> setupRouter() async {
    // Create storage
    const storage =  FlutterSecureStorage();

    // Read value 
    String? token = await storage.read(key: 'token');

    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => token != null ? const HomeView() : const WelcomeView(),
      ),
      GoRoute(
        path: kWelcomeView,
        builder: (context, state) =>  const WelcomeView(),
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
        builder: (context, state) => const HomeView(),
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
