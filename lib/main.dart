import 'package:assignment/providers/cart_provider.dart';
import 'package:assignment/themes/state_app.dart';
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
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: providerStateApp(),
      ),
    );
  }
}
