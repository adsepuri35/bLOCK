import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/account_page.dart';
import 'package:myapp/components/search_bar.dart';

class FilesPage extends StatefulWidget {
  @override
  _FilesPageState createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index != _selectedIndex) {
      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => AccountPage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SearchBar(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feed),
            label: 'Files',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_rounded),
            label: 'Account',
          ),
        ],
        selectedItemColor: Colors.blue[750],
        unselectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
