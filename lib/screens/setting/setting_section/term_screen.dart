// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              "TERMS & CONDITIONS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Center(
              child: Text(
                "MOBILE APPLICATION AND MEMBERSHIP CARD",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                "By signing up an account via the KOI Thé Cambodia Mobile Application (“App”), which is owned and operated by KARANAK KOI Café Pte., Ltd. (“Company”) and its licensors, if any, to register the KOI Thé Cambodia Membership Card (“Card”) for a membership with the Company, you agree and are bound by following terms and conditions (“Terms of Use”):"),
            _buildTitle("Agreement to Terms of Use"),
            _buildPara("1. The Company reserves the right to, at its discretion, modify these Terms of Use at any time without notice. The change shall be effective immediately upon posting on the App. 2. Although the Company uses its reasonable effort to notify the change, it is your sole responsibility to check these Terms of Use from time to time to keep yourself updated with the change. Your continued use of the App or the Card following any of the changes will be deemed as your acceptance and agreement to such change.")
          ],
        ),
      ),
    );
  }
}

Widget _buildTitle(String title) {
  return Text(
    title,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
  );
}

Widget _buildPara(String para) {
  return Text(
    para,
    style: TextStyle(fontSize: 15),
  );
}
