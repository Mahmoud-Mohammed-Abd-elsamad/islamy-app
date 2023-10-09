import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class AppProvider extends ChangeNotifier{

    bool isArabicEnable = false;
    bool isDarkThemeEnabled = false;

   Future<bool>?  getLanguage()async{

     final SharedPreferences prefs = await SharedPreferences.getInstance();
     final bool value = prefs.getBool('lang')?? false;
     isArabicEnable = value;
       notifyListeners();

       return value;


   }

          setLanguages(bool value)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('lang', value);
    isArabicEnable = value;
    notifyListeners();
  }


    Future<bool>?  getTheme()async{

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final bool value = prefs.getBool('theme')?? false;
      isDarkThemeEnabled = value;
      notifyListeners();

      return value;


    }

    setTheme(bool value)async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('theme', value);
      isDarkThemeEnabled = value;
      notifyListeners();
    }


   // saveLanguage(isArabicEnabled) async{
   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
   //   await prefs.setBool('lang', isArabicEnabled);
   //   notifyListeners();
   //
   // }
   //
   // getLanguage()async{
   //   final SharedPreferences prefs = await SharedPreferences.getInstance();
   //   final bool value = prefs.getBool('lang')?? false;
   //   isArabicEnabled = value;
   //   notifyListeners();
   //
   //
   //
   //
   // }



}