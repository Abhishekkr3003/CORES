import 'package:flutter/material.dart';
import 'package:flutter_application_1/Stores/my_store.dart';
import 'package:flutter_application_1/Pages/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/Utils/routes.dart';

void main() { 
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Splash2(),
      routes: MyRoutes.routes,
    );
  }
}
