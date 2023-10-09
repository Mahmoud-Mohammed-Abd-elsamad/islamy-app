import 'package:flutter/material.dart';

import 'package:islami_app/providers/app_provider.dart';
import 'package:islami_app/screens/hadeth_screen.dart';
import 'package:islami_app/screens/quran_screen.dart';
import 'package:islami_app/screens/radio_screen.dart';
import 'package:islami_app/screens/sebha_screen.dart';
import 'package:islami_app/screens/setting.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String routeName = "hmowScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curentIndex = 0;
   List  screens = [
     QuranScreen(),const HadethScreen(),const SebhaScreen(),const RadioScreen(),const SettingsScreen()

  ];

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration:  BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Provider.of<AppProvider>(context).isDarkThemeEnabled? "assets/images/dark_bg.png":"assets/images/default_bg.png"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title:  Text(AppLocalizations.of(context)!.islami,style:Theme.of(context).textTheme.bodyLarge)
            ,),

          body: screens[curentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: curentIndex,

            onTap: (index) =>setState(() => curentIndex = index) ,// This is all you need!
            items:  [
              BottomNavigationBarItem(icon:
              const ImageIcon(AssetImage("assets/images/icon_quran.png")),
                  label: AppLocalizations.of(context)!.quran

                     ),
              BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/images/icon_hadeth.png"),
                  ),label: AppLocalizations.of(context)!.hadeth,
              ),
              BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/images/icon_sebha.png"),
                  ),label: AppLocalizations.of(context)!.sebha,
              ),
              BottomNavigationBarItem(icon: const ImageIcon(AssetImage("assets/images/icon_radio.png"),
                  ),label: AppLocalizations.of(context)!.radio,
              ), BottomNavigationBarItem(icon: const Icon(Icons.settings,),
                label: AppLocalizations.of(context)!.settings,),



            ],
          ),),
    );
  }
}
