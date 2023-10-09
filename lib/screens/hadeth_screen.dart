

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../constants.dart';
import '../widgets/list_hadeth_number_widget.dart';

class HadethScreen extends StatelessWidget {
  const HadethScreen({Key? key}) : super(key: key);
  static String routeName = "quran_screen";

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
           SizedBox(height: height * .023,),
           Padding(
            padding: EdgeInsets.all(height * .038),
            child: Image(image: AssetImage("assets/images/hadeth_logo.png"),fit: BoxFit.cover,),
          ),
          const Divider(
            thickness: 3,
            color: KprimaryColor,
          ),
          Text(
            AppLocalizations.of(context)!.ahadeth,
            style: Theme.of(context).textTheme.bodyLarge
          ),
          const Divider(
            thickness: 3,
            color: KprimaryColor,
          ),
          Expanded(
            child: ListView.builder(itemCount: 50, itemBuilder: (BuildContext context, int index) {
             return ListHadethNumberWidget(hadethNumber:index + 1,);
            },
            ),
          ) ],

      );
  }

  }
