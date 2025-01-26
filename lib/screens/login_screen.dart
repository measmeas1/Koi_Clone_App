// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:assignment/themes/state_app.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildLoginSection(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Center(
        child: Text(
          "LOGIN",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 80),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("lib/assets/images.png",),
            _buildTextField("Username", false, _usernameController),
            SizedBox(height: 10),
            _buildTextField("Password", true, _passwordController),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle login logic here
                  if (_usernameController.text == "clone" &&
                      _passwordController.text == "123") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => providerStateApp()));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Invalid username or password")));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange.shade700,
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text('Don\'t have an account? Sign up here'),
            GestureDetector(
              onTap: () {
                // Navigate to Sign Up screen
                // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.orange.shade700),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hint, bool obscure, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: obscure && !_isPasswordVisible, // Toggle password visibility
      decoration: InputDecoration(
        labelText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        suffixIcon: obscure
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.orange.shade700,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : null,
      ),
    );
  }
}
