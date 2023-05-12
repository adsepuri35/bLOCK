import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:myapp/pages/blockchain_submission.dart';

Future<List<String>> getFileNames() async {
  String filePath = 'users/$userId/files';
  ListResult result = await FirebaseStorage.instance.ref(filePath).listAll();

  List<String> fileNames = [];

  result.items.forEach((Reference ref) {
    fileNames.add(ref.name);
  });

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
    return FutureBuilder(
      future: getFileNames(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Column(
            children: snapshot.data
                ?.map((fileName) => Text(fileName))
                .toList() ?? [],
          );
        } else if (snapshot.connectionState == ConnectionState.none) {
          return Text("No data");
        }
        return CircularProgressIndicator();
      },
    );
  }
}