import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islami_app/constants.dart';
import 'package:islami_app/model/sora_information.dart';
import 'package:provider/provider.dart';

import '../providers/app_provider.dart';


class SoraContent extends StatefulWidget {
   const SoraContent({Key? key}) : super(key: key);
  static String routeName = "soraContent";

  @override
  State<SoraContent> createState() => _SoraContentState();
}

class _SoraContentState extends State<SoraContent> {
  String soraTextContent = "" ;
  int soraIndex = 1;
  List verses = [];


  getData(int index)async{
    String response;
    response = await rootBundle.loadString("assets/sora_name/${index+1}.txt");
      List soraLines = response.split("\n");
      verses = soraLines;

    setState(() {
    });

  }

  @override
  Widget build(BuildContext context) {
    SoraInformation? soraInformation =  ModalRoute.of(context)!.settings.arguments as SoraInformation?;
    getData(soraInformation!.index);

    return Scaffold(
      backgroundColor: Provider.of<AppProvider>(context).isDarkThemeEnabled ? Colors.black : Colors.white,
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Text("سورة${soraInformation.soraname}",style: Theme.of(context).textTheme.bodySmall,),
                Text("بسم الله الرحمن الرحيم",style: Theme.of(context).textTheme.bodySmall,)
              ],),
          ),
          Expanded(
            child: Center(
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Center(child: Text("${verses[index]}",style: Theme.of(context).textTheme.bodySmall,textAlign: TextAlign.center,));

                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: KprimaryColor,);
                }, itemCount: verses.length,

              ),
            ),
          )
        ],),
      ));

  }


}
