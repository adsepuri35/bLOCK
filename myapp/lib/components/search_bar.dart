import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Container(
                height: 30,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
