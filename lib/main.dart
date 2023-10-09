import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/mytheme.dart';
import 'package:islami_app/providers/app_provider.dart';
import 'package:islami_app/providers/theme_change.dart';
import 'package:islami_app/screens/hadeth_content.dart';
import 'package:islami_app/screens/quran_screen.dart';
import 'package:islami_app/screens/setting.dart';
import 'package:islami_app/screens/sora_content.dart';
import 'package:islami_app/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<AppProvider>(
      create: (_) => AppProvider()..getLanguage()..getTheme()),
    ChangeNotifierProvider<ThemeChange >(
      create: (_) => ThemeChange() ,
    ),



  ],
  child: const IslamiApp()));
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        QuranScreen.routeName:(_)=>QuranScreen(),
        HomeScreen.routeName:(_)=>const HomeScreen(),
        SoraContent.routeName:(_)=>const SoraContent(),
        SettingsScreen.routName:(_)=>const SettingsScreen(),
        HadethContentScreen.routeName:(_)=>const HadethContentScreen()
      },
      theme:Provider.of<AppProvider>(context).isDarkThemeEnabled ? MyThemeData.darkTheme : MyThemeData.lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'), // Arabic
         // English
      ],
      locale:  Locale(Provider.of<AppProvider>(context).isArabicEnable ? "ar":"en"),
      home: const SplashScreen(),


    );
        }
}
