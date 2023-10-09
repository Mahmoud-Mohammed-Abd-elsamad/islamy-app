import 'package:flutter/material.dart';
import 'package:islami_app/screens/hadeth_content.dart';

class ListHadethNumberWidget extends StatelessWidget {
  ListHadethNumberWidget({super.key, required this.hadethNumber});

  int hadethNumber;




  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Center(child: GestureDetector(child
          : Text("حديث رقم $hadethNumber",),
        onTap: (){
          Navigator.pushNamed(context, HadethContentScreen.routeName,arguments:hadethNumber);

        },)),
      const Divider(thickness: 3,color: Colors.white,)
    ],);
  }
}
