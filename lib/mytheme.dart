import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class MyThemeData {

   static ThemeData lightTheme = ThemeData(
      appBarTheme: const AppBarTheme(
         backgroundColor: Colors.transparent,
         elevation: 0,
         centerTitle: true,
            ),
      textTheme: TextTheme(
         bodyLarge: GoogleFonts.elMessiri(textStyle: const TextStyle(
             fontSize: 30,color: KBlackColor,fontWeight: FontWeight.bold
         ),),
        bodyMedium:  GoogleFonts.elMessiri(textStyle: const TextStyle(
            fontSize: 25,color:KBlackColor,fontWeight: FontWeight.bold
        ),),
        bodySmall: GoogleFonts.elMessiri(textStyle: const TextStyle(
            fontSize: 22,color: KBlackColor,fontWeight: FontWeight.bold
        ),),

      ),

     bottomNavigationBarTheme: const BottomNavigationBarThemeData(
       selectedItemColor: Colors.black,
       showUnselectedLabels: false,
       backgroundColor: KprimaryColor,
       type: BottomNavigationBarType.fixed,
         selectedIconTheme: IconThemeData(
             color:kWightColor
         )

     )
      );
   static ThemeData darkTheme = ThemeData(
       appBarTheme: const AppBarTheme(
         backgroundColor: Colors.transparent,
         elevation: 0,
         centerTitle: true,
       ),
       textTheme: TextTheme(
         bodyLarge: GoogleFonts.elMessiri(textStyle: const TextStyle(
             fontSize: 30,color: kWightColor,fontWeight: FontWeight.bold
         ),),
         bodyMedium:  GoogleFonts.elMessiri(textStyle: const TextStyle(
             fontSize: 25,color:kWightColor,fontWeight: FontWeight.bold
         ),),
         bodySmall: GoogleFonts.elMessiri(textStyle: const TextStyle(
             fontSize: 22,color: kWightColor,fontWeight: FontWeight.bold
         ),),

       ),

       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
         selectedItemColor: KprimaryColor,
         showUnselectedLabels: false,
         backgroundColor: KBlackColor,
         type: BottomNavigationBarType.fixed,
         selectedIconTheme: IconThemeData(
           color: KprimaryColor
         ),unselectedIconTheme: IconThemeData(
           color: kWightColor
       ),

       )
   );

}
