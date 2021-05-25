import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviewebsite/ui/homepage/homepage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class App extends StatelessWidget {
  // root widget of the app
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.cupertino,
        theme: ThemeData(
          cardColor: Color(0xFF151F2E),
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xFF020916),
          textTheme: GoogleFonts.montserratTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF182131),
          ),
        ),
        home: HomePage(),
      );
    });
  }
}
