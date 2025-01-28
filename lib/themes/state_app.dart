// ignore_for_file: prefer_const_constructors

import 'package:assignment/controller/section_screen.dart';
import 'package:assignment/themes/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


Widget providerStateApp() {
  return MultiProvider(
    providers: [
      
      ChangeNotifierProvider(create: (context) => ThemeLogic()),
      // ChangeNotifierProvider(create: (context) => LanguageLogic()),
    ],
    child: StateApp(),
  );
}

class StateApp extends StatelessWidget {
  const StateApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeMode mode = context.watch<ThemeLogic>().mode;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SectionScreen(selectedIndex: 0,),
      themeMode: mode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        )
      
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        
      ),
    );
  }
}
