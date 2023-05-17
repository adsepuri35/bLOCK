import 'package:flutter/material.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/account_page.dart';
import 'package:myapp/components/file_options_box.dart';
import 'package:camera/camera.dart';
import 'package:myapp/pages/camera.dart';
import 'package:myapp/components/files_display.dart';
import 'package:myapp/components/search_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/pages/blockchain_submission.dart';

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

  Future<void> _uploadImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      String imagePath = image.path;

      // Navigate to BlockchainConfirmationScreen with imagePath
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlockchainConfirmationScreen(imagePath: imagePath),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff02040f),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/images/bLOCK_logo.png', width: 110, height: 110),
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
                Search_Bar(),
                const SizedBox(height: 25.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FileOptionsBox(
                      text: 'Import File',
                      fileIcon: Icons.file_upload,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 15),
                    FileOptionsBox(
                      text: 'Upload Image',
                      fileIcon: Icons.image_outlined,
                      onPressed: _uploadImage,
                    ),
                    const SizedBox(width: 15),
                    FileOptionsBox(
                      text: 'Create Folder',
                      fileIcon: Icons.create_new_folder,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Files',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                FilesList(),
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
