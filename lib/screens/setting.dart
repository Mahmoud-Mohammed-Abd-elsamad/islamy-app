import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static String routName = "settingScreenRoute";


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
              SizedBox(
              height: height * .116
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Switch(
                    activeColor: KprimaryColor,
                      value: Provider.of<AppProvider>(context).isArabicEnable,
                      onChanged: (value) {
                        Provider.of<AppProvider>(context,listen: false
                        ).setLanguages(value);
                      }),
                  const Spacer(),
                  const Text("Language(Ar,العربيه)")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Switch(
                      activeColor: KprimaryColor,

                      value: Provider.of<AppProvider>(context).isDarkThemeEnabled,
                      onChanged: (value) {
                        Provider.of<AppProvider>(context,listen: false
                        ).setTheme(value);
                      }),
                  const Spacer(),
                  const Text("Theme(dark,light)")
                ],
              ),
            ),
          ],
        ));
  }
}
