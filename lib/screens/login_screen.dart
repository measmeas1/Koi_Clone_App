// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:assignment/screens/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
