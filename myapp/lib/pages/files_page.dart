import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/account_page.dart';
import 'package:myapp/components/search_bar.dart';
import 'package:myapp/components/file_options_box.dart';
import 'package:camera/camera.dart';
import 'package:myapp/pages/camera.dart';
import 'package:myapp/components/file_box.dart';

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
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/RAM.png', width: 45, height: 45),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
            child: Column(
              children: [
                SearchBar(),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FileOptionsBox(
                        text: 'Import File', fileIcon: Icons.file_upload),
                    const SizedBox(width: 15),
                    FileOptionsBox(
                        text: 'Upload Image', fileIcon: Icons.image_outlined),
                    const SizedBox(width: 15),
                    FileOptionsBox(
                        text: 'Create Folder',
                        fileIcon: Icons.create_new_folder),
                  ],
                ),
                const SizedBox(height: 15.0),
                Text(
                  'Files',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15.0),
                Column(
                  children: [
                    FileBox(fileName: 'Sample File', uploadDate: '4/21/23',),
                    const SizedBox(height: 10,),
                    FileBox(fileName: 'Sample File 2', uploadDate: '4/21/23',),
                    const SizedBox(height: 10,),
                    FileBox(fileName: 'Sample File 3', uploadDate: '4/20/23',),
                    const SizedBox(height: 10,),
                    FileBox(fileName: 'Sample File 4', uploadDate: '4/18/23',),
                  ],
                ),
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
