import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/files_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/components/profile.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;

  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: signUserOut,
            icon: Icon(Icons.logout),
          )
        ],
        backgroundColor: Colors.blue[750],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Profile(),
                Text(
                  "Logged in as: " + user.email!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: () {},
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
        currentIndex: 2,
        onTap: (int index) {
          if (index == 2) {
            // Do nothing because we are already on this page
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => getPage(index)),
            );
          }
        },
      ),
    );
  }

  Widget getPage(int index) {
    if (index == 0) {
      return HomePage();
    } else if (index == 1) {
      return FilesPage();
    } else {
      return AccountPage();
    }
  }
}
