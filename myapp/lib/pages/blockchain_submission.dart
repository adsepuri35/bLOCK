import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:myapp/components/my_button.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// A widget that displays the picture taken by the user.
class BlockchainConfirmationScreen extends StatefulWidget {
  final String imagePath;

  const BlockchainConfirmationScreen({super.key, required this.imagePath});

  @override
  State<BlockchainConfirmationScreen> createState() => _BlockchainConfirmationScreenState();
}

class _BlockchainConfirmationScreenState extends State<BlockchainConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController =
        TextEditingController();

    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(title: const Text('Submit to Blockchain')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25.0,
                vertical: 10.0,
              ),
              child: Column(
                children: [
                  Image.file(File(widget.imagePath)),
                  const SizedBox(height: 15),
                  const Text(
                    'Title:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: TextField(
                      controller: _textEditingController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                        hintText: 'Add a title for your file...',
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        String fileTitle = _textEditingController.text;

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Hooray!'),
                              content: Text(
                                  '$fileTitle has been safely stored on the RAM blockchain!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );

                        final User? user = FirebaseAuth.instance.currentUser;
                        final String userId = user!.uid;

                        File file = File(widget.imagePath);
                        //String fileName = fileTitle;
                        FirebaseStorage storage = FirebaseStorage.instance;
                        Reference ref = storage.ref().child("users/$userId/files/${_textEditingController.text}");

                        UploadTask uploadTask = ref.putFile(file);
                          await uploadTask.whenComplete(() async {
                            var url = await ref.getDownloadURL();
                            String fileUrl = url.toString();
                          }).catchError((onError) {
                            print(onError);
                          });
                        },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      child: Text('Add to Blockchain'),
                    ),
                  ),

                  //MyButton(onTap: onTap, text: 'Add to Blockchain')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
