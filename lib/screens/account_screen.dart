import 'package:assignment/data/announcements.dart';
import 'package:assignment/screens/announcements/announcement_screen.dart';
import 'package:assignment/screens/home_screen.dart';
import 'package:assignment/screens/setting/setting_screen.dart';
import 'package:assignment/themes/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = context.watch<ThemeLogic>().mode;

    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileSection(),
            _buildPointsCard(_themeMode),
            _buildMyCardsSection(),
            _buildActionButtons(_themeMode),
            _buildGridSection('PERSONAL', [
              _buildTile(Icons.inbox, 'Inbox', context, HomeScreen()),
              _buildTile(Icons.tune, 'Personalization', context, HomeScreen()),
              _buildTile(Icons.favorite, 'Favorites', context, HomeScreen()),
              _buildTile(Icons.location_on, 'Addresses', context, HomeScreen()),
              _buildTile(Icons.card_giftcard, 'Vouchers', context, HomeScreen()),
            ]),
            _buildGridSection('SHORTCUTS', [
              _buildTile(Icons.store, 'Stores', context, HomeScreen()),
              _buildTile(Icons.campaign, 'Announcements', context, AnnouncementScreen(announcements: announcements)),
              _buildTile(Icons.star, 'Rewards', context, HomeScreen()),
            ]),
            _buildGridSection('CONTACTS', [
              _buildTile(Icons.support_agent, 'Customer Service', context, HomeScreen()),
              _buildTile(Icons.feedback, 'Feedback', context, HomeScreen()),
            ]),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Account'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.menu, color: Colors.orange.shade700),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingScreen())),
        ),
      ],
    );
  }

  Widget _buildProfileSection() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            ClipOval(child: Icon(Icons.account_circle, size: 120, color: Colors.grey)),
            Text("Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            SizedBox(height: 5),
            Text("View Profile >", style: TextStyle(color: Colors.grey.shade600)),
          ],
        ),
      ),
    );
  }

  Widget _buildPointsCard(ThemeMode themeMode) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: themeMode == ThemeMode.dark ? Colors.grey.shade900 : Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: themeMode == ThemeMode.dark ? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPointsIcon(themeMode),
              _buildMemberDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPointsIcon(ThemeMode themeMode) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          width: 10,
          color: themeMode == ThemeMode.dark ? Colors.brown.shade800 : Colors.orange.shade100,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("0", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Text("pts", style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  Widget _buildMemberDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(width: 4, color: Colors.orange.shade800),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(width: 10),
            Text("Black Member", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 5),
          child: Text("151 to Silver Member", style: TextStyle(color: Colors.grey.shade500)),
        ),
      ],
    );
  }

  Widget _buildMyCardsSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("MY CARDS (0)", style: TextStyle(fontSize: 12, color: Colors.grey.shade700)),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ThemeMode themeMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildActionButton(Icons.add_shopping_cart, "Purchase", themeMode),
          SizedBox(width: 15),
          _buildActionButton(Icons.add_outlined, "Add", themeMode),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, ThemeMode themeMode) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: themeMode == ThemeMode.dark ? Colors.grey.shade900 : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(icon, color: Colors.orange.shade700, size: 25),
          ),
        ),
        SizedBox(height: 3),
        Text(label, style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
      ],
    );
  }

  Widget _buildGridSection(String title, List<Widget> tiles) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(title),
          SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 2.5,
            children: tiles,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 15, color: Colors.grey.shade700, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildTile(IconData icon, String label, BuildContext context, Widget targetScreen) {
    ThemeMode themeMode = context.watch<ThemeLogic>().mode;

    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => targetScreen)),
      child: Container(
        decoration: BoxDecoration(
          color: themeMode == ThemeMode.dark ? Colors.grey.shade900 : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, size: 30, color: Colors.grey.shade600),
              SizedBox(height: 4),
              Text(label, style: TextStyle(fontSize: 14), textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
