import 'package:assignment/providers/cart_provider.dart';
import 'package:assignment/screens/account_screen.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/setting_screen.dart';
import 'package:assignment/controller/section_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: MaterialApp(
        title: 'KOI Clone',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: SectionScreen(),
      ),
    );
  }
}
