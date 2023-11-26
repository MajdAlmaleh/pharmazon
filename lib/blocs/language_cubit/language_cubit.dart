import 'package:bloc/bloc.dart';
import 'package:pharmazon/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<String> {
  LanguageCubit() : super(kEnglish) {
    loadLanguage();
  }

  Future<void> loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String language = prefs.getString('language') ?? kEnglish;
    emit(language);
  }

  Future<void> changeLanguage() async {
    if (state == kEnglish) {
      emit(kArabic);
    } else if (state == kArabic) {
      emit(kEnglish);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', state);
  }
}
