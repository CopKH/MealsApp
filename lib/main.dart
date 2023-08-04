import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/tabs.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 228, 160, 64),
              brightness: Brightness.dark),
          useMaterial3: true,
          textTheme: GoogleFonts.latoTextTheme()
          ),
      home: const TabsScreen(),
      // home: MealsScreen(
      //   meals: dummyMeals,
      //   title: 'xxx',
      // ),
    );
  }
}
