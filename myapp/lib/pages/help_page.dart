import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff02040f),
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Column(
              children: [
                Center(
                  child: const Text(
                    'App Navigation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'Use the bottom navigation bar to move between the home, files, and account page.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: const Text(
                    'Scan & Upload Files',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'To scan a new file with your camera, press the camera icon in the bottom right corner of either the home or file page. You will be prompted to take a picture: aim your camera at the desired page or object you want to scan, try to fill up as much of the screen as possible; when you are satisfied, take the picture. Repeat this process until you have finished scanning all pages of the document. Then fill out some basic information including the title and an optional description. Once you are done, press complete and the file will be uploaded to the blockchain. Once the file has been uploaded to the blockchain, it cannot be modified or be tampered with.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: const Text(
                    'Importing Files & Images',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'You can also upload files/photos from your phone or Google Drive. To do so, head to the files page and click the “Import Files” or “Import Images” button depending on which you want to upload. You will be prompted to select the files from your Google Drive/phone storage or your camera roll. Then fill out some basic information including the title and an optional description. Once you are done, press complete and the file will be uploaded to the blockchain. Once the file has been uploaded to the blockchain, it cannot be modified or be tampered with.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: const Text(
                    'Creating Folders',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'To view previously uploaded files, go to the files page. On this page, all of your uploaded files will be displayed. They can be sorted by upload date, last opened, or title name; you can also search for a specific file using the top search bar. In addition, you can click the “Create Folder” button to create a new folder to organize your files.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: const Text(
                    'Viewing Files',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'To view a file more in depth, click on the file in the files page. This will bring you to a document view, showing all of the pages of the file. From here, you will also have the option to share the file to others or download a copy of the file from the blockchain.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: const Text(
                    'Account Settings',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(
                  'You can head over to the accounts page to view any account details and app settings. You can also seek help or give feedback. Lastly, you are able to sign out of your account on this page.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
