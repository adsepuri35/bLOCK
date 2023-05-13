import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:myapp/pages/document_view.dart';

Future<String> getDownloadUrl(FullMetadata metadata) async {
  final reference = FirebaseStorage.instance.ref().child(metadata.fullPath);
  final downloadUrl = await reference.getDownloadURL();
  return downloadUrl;
}

class FileBox extends StatelessWidget {
  final FullMetadata metadata;
  final String fileName;
  final DateTime? uploadDate;

  FileBox({Key? key, required this.metadata})
      : fileName = metadata.name,
        uploadDate = metadata.timeCreated,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final imageUrl = await getDownloadUrl(metadata);
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DocumentView(
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: Container(
        width: 550,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            children: [
              Icon(
                Icons.insert_drive_file,
                size: 60,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    const SizedBox(height: 5),
                    Text('Uploaded: $uploadDate'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
