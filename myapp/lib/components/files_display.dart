import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/components/file_box.dart';

final User? user = FirebaseAuth.instance.currentUser;
final String userId = user!.uid;

/*
Future<List<String>> getFileNames() async {
  String filePath = 'users/$userId/files';
  ListResult result = await FirebaseStorage.instance.ref(filePath).listAll();

  List<String> fileNames = [];

  result.items.forEach((Reference ref) {
    fileNames.add(ref.name);
  });

  return fileNames;
}
*/

Future<List<FullMetadata>> getMetadataList() async {
  // Get a reference to the folder
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference folderRef = storage.ref('users/$userId/files');

  // List all files in the folder
  ListResult listResult = await folderRef.listAll();

  // Initialize an empty list to store the metadata
  List<FullMetadata> metadataList = [];

  // Iterate through the files and retrieve their metadata
  for (Reference fileRef in listResult.items) {
    FullMetadata metadata = await fileRef.getMetadata();
    metadataList.add(metadata);
  }

  return metadataList;
}

Future<List<String>> getFileNames() async {
  // Get a reference to the folder
  FirebaseStorage storage = FirebaseStorage.instance;
  Reference folderRef = storage.ref('users/$userId/files');

  // List all files in the folder
  ListResult listResult = await folderRef.listAll();

  // Initialize an empty list to store the file names
  List<String> fileNames = [];

  // Iterate through the files and retrieve their metadata
  for (Reference fileRef in listResult.items) {
    FullMetadata metadata = await fileRef.getMetadata();
    fileNames.add(metadata.name);
  }

  return fileNames;
}

class FilesList extends StatefulWidget {
  const FilesList({super.key});

  @override
  State<FilesList> createState() => _FilesListState();
}

class _FilesListState extends State<FilesList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FullMetadata>>(
      future: getMetadataList(),
      builder:
          (BuildContext context, AsyncSnapshot<List<FullMetadata>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: \${snapshot.error}'));
        } else {
          List<FullMetadata> metadataList = snapshot.data!;
          if (metadataList.isEmpty) {
            return Center(child: Text('No files found.'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: metadataList
              .expand((metadata) => [
                FileBox(
                  metadata: metadata,
                ),
                const SizedBox(height: 10),
              ])
              .toList()
              ..removeLast(),
          );
        }
      },
    );
  }
}
