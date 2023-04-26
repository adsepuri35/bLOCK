import 'package:flutter/material.dart';

class FileOptionsBox extends StatelessWidget {
  final String text;
  final IconData fileIcon;
  const FileOptionsBox({super.key, required this.text, required this.fileIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 95.0,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Icon(
            fileIcon,
            size: 48,
            color: Colors.white,
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
