import 'package:flutter/material.dart';
import 'package:islami_app/model/sora_information.dart';
import 'package:islami_app/screens/sora_content.dart';

class ListSoraNameWidget extends StatelessWidget {
   ListSoraNameWidget({super.key, required this.soraName,required this.index});

  String soraName;
  int index;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
    Center(child: GestureDetector(child
        : Text(soraName,style: Theme.of(context).textTheme.bodySmall,),
    onTap: (){
        Navigator.pushNamed(context, SoraContent.routeName,arguments:SoraInformation(soraname: soraName, index: index));

    },)),
    const Divider(thickness: 3,color: Colors.white,)
    ],);
  }
}
