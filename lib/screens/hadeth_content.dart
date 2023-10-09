import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';

class HadethContentScreen extends StatefulWidget {
  const HadethContentScreen({Key? key}) : super(key: key);
  static String routeName = "hadethContentScreen";

  @override
  State<HadethContentScreen> createState() => _HadethContentScreenState();
}

class _HadethContentScreenState extends State<HadethContentScreen> {
  String? hadeth;
  int? hadethnumber;

  getData(int index) async {
    String response;
    response = await rootBundle.loadString("assets/hadeth/h$index.txt");
    setState(() {
      hadeth = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    hadethnumber = ModalRoute.of(context)!.settings.arguments as int?;
    getData(hadethnumber!);
    return Scaffold(
      backgroundColor: Provider.of<AppProvider>(context).isDarkThemeEnabled ? Colors.black : Colors.white,
      body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top:50),
              child: Text(
        "$hadeth",
        style: const TextStyle(fontSize: 21),textAlign: TextAlign.center,
      ),
            ),
          )),
    );
  }
}
