import 'dart:math';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/constants.dart';
import 'package:islami_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);
  static String routeName = "quran_screen";

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  String? zeker;
  int numberTasbeh = 0;
  List<String> azkzrList = ["سبحان الله","الحمد لله","الله اكبر"];
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    setRotatation(10);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  void setRotatation(int degrees) {
    final angle = degrees * pi / 180;
    animation = Tween<double>(begin: 0, end: angle).animate(controller);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const SizedBox(
          height: 75,
        ),
        Padding(
          padding:  EdgeInsets.all(height * .028),
          child: Stack(
            children: [
              Container(
                height: 312,
                width: 230,
                color: Colors.transparent,
              ),
              Positioned(
                top: 0,
                left: 100,
                child: Image(
                    image: AssetImage(
                        Provider.of<AppProvider>(context).isDarkThemeEnabled
                            ? "assets/images/head_sebha_dark.png"
                            : "assets/images/head_sebha_logo.png")),
              ),
              Positioned(
                bottom: 5,
                child: AnimatedBuilder(
                  animation: animation,
                  child: Image(
                      image: AssetImage(
                          Provider.of<AppProvider>(context).isDarkThemeEnabled
                              ? "assets/images/body_sebha_dark.png"
                              : "assets/images/body_sebha_logo.png")),
                  builder: (context, child) =>
                      Transform.rotate(angle: animation.value, child: child),
                ),
              )
            ],
          ),
        ),
         SizedBox(
          height: height * .025,
        ),
        Text(
          "${AppLocalizations.of(context)!.thenumberofpraises} ",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Center(
            child: Container(
          height: height * .075,
          width: height * .07,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            color: Provider.of<AppProvider>(context).isDarkThemeEnabled
                ? const Color(0xFF0F1424)
                : KprimaryColor,
          ),
          child: Center(
              child: Text(
            "$counter",
            style: const TextStyle(fontSize: 26),
          )),
        )),
        Padding(
          padding:  EdgeInsets.all(height * .028),
          child: Center(
            child: GestureDetector(
              child: Container(
                height: 55,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: Provider.of<AppProvider>(context).isDarkThemeEnabled
                      ? KDarkPrimaryColor
                      : KprimaryColor,
                ),
                child: Center(
                    child: Text(
                  azkzrList[numberTasbeh],
                  style: const TextStyle(fontSize: 26),
                )),
              ),
              onTap: () {
                controller.forward(from: 0);
                setState(() {
                  tasbeh();
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  void tasbeh() {
    //int turn = 1;

    if (counter < 33) {
      counter ++;
      zeker = azkzrList[numberTasbeh];
    } else {
      counter = 0;
      numberTasbeh++;

    }
    if(numberTasbeh > 2){
      counter = 0;
      numberTasbeh = 0;
    }

  }
}
