import 'package:flutter/material.dart';

class FileBox extends StatelessWidget {
  final String fileName;
  final String uploadDate;
  const FileBox({super.key, required this.fileName, required this.uploadDate});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Uploaded: $uploadDate'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
