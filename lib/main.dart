import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageCubit = LanguageCubit();

  await Future.wait([languageCubit.loadLanguage()]);

  final router = await AppRouter.setupRouter();
  setupServiceLocator();
  runApp(BlocProvider(
    create: (context) => LanguageCubit(),
    child: Pharmazon(
      router: router,
    ),
  ));
}

class Pharmazon extends StatelessWidget {
  const Pharmazon({super.key, required this.router});
  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, String>(
      
      builder: (context, state) {
        return MaterialApp.router(
          locale: Locale(state),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
