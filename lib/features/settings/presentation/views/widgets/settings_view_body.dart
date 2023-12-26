import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pharmazon/blocs/language_cubit/language_cubit.dart';
import 'package:pharmazon/constants.dart';
import 'package:pharmazon/core/utils/api_service.dart';
import 'package:pharmazon/core/utils/app_router.dart';
import 'package:pharmazon/core/utils/service_locator.dart';
import 'package:pharmazon/features/home/data/repos/home_repo_impl.dart';
import 'package:pharmazon/generated/l10n.dart';

class SettingsViewBody extends StatefulWidget {
  const SettingsViewBody({super.key});

  @override
  SettingsViewBodyState createState() => SettingsViewBodyState();
}

class SettingsViewBodyState extends State<SettingsViewBody> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    isSelected = [
      S.of(context).language == 'english',
      S.of(context).language == 'عربي'
    ];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(S.of(context).Language),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 3,
              width: MediaQuery.of(context).size.width * .4,
              child: Container(
                color: kAppColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ToggleButtons(
              borderColor: kAppColor,
              fillColor: kAppColor,
              borderWidth: 2,
              selectedBorderColor: kAppColor,
              selectedColor: Colors.white,
              borderRadius: BorderRadius.circular(0),
              onPressed: (int index) {
                setState(() {
                  for (int i = 0; i < isSelected.length; i++) {
                    isSelected[i] = i == index;
                  }
                });
                if (index == 1) {
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(toLanguage: kArabic);
                } else if (index == 0) {
                  BlocProvider.of<LanguageCubit>(context)
                      .changeLanguage(toLanguage: kEnglish);
                }
              },
              isSelected: isSelected,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('English', style: TextStyle(fontSize: 16)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('العربية', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Text('${S.of(context).logOut}:'),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: 3,
              width: MediaQuery.of(context).size.width * .4,
              child: Container(
                color: kAppColor,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              onTap: () {
                GoRouter.of(context).go(AppRouter.kAuthView);
                HomeRepoImpl(getIt<ApiService>()).logOut();
              },
              leading: const Icon(
                Icons.logout,
              ),
              title: Text(
                S.of(context).logOut,
                style: const TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}
