// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
FaqScreen({super.key});

  // The FAQ data structure with titles, questions, and answers.
  final List<Map<String, dynamic>> faqData = [
    {
      'title': 'CARD INFORMATION',
      'faq': [
        {
          'question': '1. Where can I use my KOI Card?',
          'answer': 'KOI Cards are accepted at all KOI Thé outlets in Cambodia except both AEON Mall.',
        },
        {
          'question': '2. What is the Black membership Card?',
          'answer': 'The Black member Card is the first KOI Card whose points are under 150 points.',
        },
        {
          'question': '3. How do I top up my KOI Card?',
          'answer': 'You can top up the balance on your KOI Card at participating KOI locations except both AEON Mall.',
        },
      ],
    },
    {
      'title': 'CARD ISSUE',
      'faq': [
        {
          'question': '4. Can I return the KOI Card that I purchased or received as a gift?',
          'answer': 'Yes, you can though you will not be able to refund back your points or any balance.',
        },
        {
          'question': '5. Does KOI charge any fee for an unused balance on my KOI Program?',
          'answer': 'No. KOI does not charge any fee for the issuance, activation or use of your KOI Card. Your KOI Card does not have an expiration date.',
        },
        {
          'question': '6. Can I still use Mobile Payment if I don’t have a network connection?',
          'answer': 'Yes, your barcode is stored locally on the phone and will be available when you open the application. However, you won’t be able to update your KOI Card balance until your network connection is restored.',
        },
      ],
    },
    {
      'title': 'MEMBERSHIP PROGRAM',
      'faq': [
        {
          'question': '7. If I pay with the KOI app, will I still earn Reward points with KOI Rewards?',
          'answer': 'Yes, paying with the KOI app for iPhone and Android is the same as paying with your registered KOI Card. You’ll earn Reward points with each eligible order.',
        },
      ],
    },
    {
      'title': 'REWARD PROGRAM',
      'faq': [
        {
          'question': '8. What is the Reward Program?',
          'answer': 'The Reward Program is a kind of program in KOI Membership, whose aim is to motivate customers to keep on supporting KOI Thé by providing them gifts as incentives. Customers may use their reward points to exchange for merchandises at KOI. (\$1 = 1 Reward Point). All your rewards have no expiration dates.',
        },
        {
          'question': '9. Does my birthday gift have an expiration date?',
          'answer': 'Your free Birthday Reward will be automatically added to your account approximately three days before your birthday, and it will be expired four days after your birthday. Simply present your registered KOI Membership Card or your KOI App to the service crew at the participating store to redeem your reward.',
        },
      ],
    },
    {
      'title': 'PRIVACY',
      'faq': [
        {
          'question': '10. Can I secure my KOI Card(s) on my mobile device with a passcode?',
          'answer': 'Yes, for even more security, you could choose to secure your KOI Card Mobile application with a passcode by going to Dashboard > Account & Settings > Passcode Lock.',
        },
        {
          'question': '11. How does KOI protect my privacy after I register my KOI Card?',
          'answer': 'Please read our Privacy Policy for details.',
        },
      ],
    },
    {
      'title': 'PASSWORD',
      'faq': [
        {
          'question': '12. What do I do if I forget my password?',
          'answer': 'Please find “Forgot Password” on the login screen, then click on it and put your Email or Phone Number. We’ll email you the instructions to retrieve your password back. The LINK will expire in 30 minutes from your request.',
        },
      ],
    },
    {
      'title': 'Sign in/Sign up Information & Issue',
      'faq': [
        {
          'question': '13. How can I update my registered information?',
          'answer': 'To update your registered account information, go to KOI App and sign in with your Email or Phone number and Password. On the next page, you can access your account setting, and edit your address book.',
        },
      ],
    },
    {
      'title': 'Application Information and Issue',
      'faq': [
        {
          'question': '14. How and where can I get the KOI App for Smartphone Application?',
          'answer': 'You can download the app from the iTunes App Store or the Playstore.',
        },
        {
          'question': '15. How can I check on my order status with the KOI App?',
          'answer': 'You will receive a Notification about your transaction.',
        },
        {
          'question': '16. How do I check my KOI Card balance?',
          'answer': 'Please go to KOI App then tap on the word “KOI PAY”. Your balance will appear on the screen.',
        },
        {
          'question': '17. How can I sign out of My KOI account?',
          'answer': 'To log out of the KOI App, go to “Account & Setting” and tap “Sign Out”.',
        },
      ],
    },
    {
      'title': 'Account Issues',
      'faq': [
        {
          'question': '18. Why can’t I sign in to my KOI account?',
          'answer': 'You may have a different email address or even multiple accounts. Please fill in the email address that is matched with your password.',
        },
        {
          'question': '19. How can I confirm my email that is linked to my KOI Card?',
          'answer': 'Please contact 070 332 925.',
        },
        {
          'question': '20. I can\'t find my KOI Card in the KOI Thé App. What should I do?',
          'answer': 'First, ensure that you are signed in to the correct KOI Thé account in which your KOI Cards are registered. If you are having problems with your Username or Password, please contact our support team at 070 332 925.',
        },
        {
          'question': '21. How do I deactivate a card on the KOI App?',
          'answer': 'Go to your KOI Thé app, select “KOI PAY” then tap on the card you want to deactivate. After that, tap on “DEACTIVATE CARD”.',
        },
        {
          'question': '22. What should I do if I change my device and want to use the KOI App on my new one?',
          'answer': 'First, install the KOI app on your new device from the app store. Then, sign in with your KOI username and password to add your cards to your new device.',
        },
        {
          'question': '23. What if I have multiple devices?',
          'answer': 'You can sign into your KOI account on multiple devices at the same time and use all the application features on all your devices.',
        },
        {
          'question': '24. What do I do if the scanner does not work and I need to pay with my KOI Card App?',
          'answer': 'First, make sure that the brightness setting on your device is at a high level. If the scanner still cannot read your barcode, simply read your KOI Card number to the service crew.',
        },
        {
          'question': '25. Where do I find my KOI Cards in the app?',
          'answer': 'Tap “KOI PAY” - and you will see your card on the screen.',
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: faqData.map((section) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(section['title']!),
                // Loop through each FAQ for this section
                ...section['faq'].map<Widget>((faq) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _question(faq['question']!),
                      _answer(faq['answer']!),
                    ],
                  );
                }).toList(),
                SizedBox(height: 40,)
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context){
    return AppBar(
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: Text(
              "FAQS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.orange.shade700),
          onPressed: ()  {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      );
  }


  Widget _title(String title) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _question(String ques) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Text(
        ques,
        style: TextStyle(fontSize: 15),
      ),
    );
  }

  Widget _answer(String ans) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        ans,
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
