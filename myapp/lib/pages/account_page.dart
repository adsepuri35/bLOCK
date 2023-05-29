import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/my_button.dart';
import 'package:myapp/pages/files_page.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/components/profile.dart';
import 'package:myapp/components/account_table.dart';
import 'package:camera/camera.dart';
import 'package:myapp/pages/camera.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser!;

  //sign user out
  void signUserOut() {
    FirebaseAuth.instance.signOut();
    Phoenix.rebirth(context);
  }

  Future<void> _takePicture() async {
    // Ensure that plugin services are initialized so that `availableCameras()`
    // can be called before `runApp()`
    WidgetsFlutterBinding.ensureInitialized();

    // Obtain a list of the available cameras on the device.
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    final firstCamera = cameras.first;

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => TakePictureScreen(camera: firstCamera)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/bLOCK_logo.png', width: 110, height: 110),
          ],
        ),
      ),
      backgroundColor: Color(0xff02040f),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const Profile(),
                const SizedBox(height: 10.0),
                AccountTable(),
                const SizedBox(height: 20.0),
                MyButton(onTap: signUserOut, text: 'Sign Out'),
                const SizedBox(height: 15.0),
                Text(
                  'Developed by',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                Image.asset('lib/images/RAM_white.png', width: 60, height: 60),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_a_photo),
        onPressed: _takePicture,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
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
        selectedItemColor: Colors.black,
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
