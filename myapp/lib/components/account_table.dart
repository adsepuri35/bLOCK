import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:myapp/pages/help_page.dart';

class AccountTable extends StatelessWidget {
  const AccountTable({super.key});

  void _recommend() {
    Share.share(
        'Check out bLOCK! It\'s a efficient way to store documents and is powered by blockchain technology!');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 350.0,
            height: 50.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 7,
                        child: Icon(Icons.settings),
                      ),
                      Positioned(
                        left: 40,
                        top: 10,
                        child: Text(
                          'Settings',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 7,
                        child: Icon(Icons.arrow_forward_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 1.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpPage()),
              );
            },
            child: Container(
              width: 350.0,
              height: 50.0,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 7,
                          child: Icon(Icons.help),
                        ),
                        Positioned(
                          left: 40,
                          top: 10,
                          child: Text(
                            'Help',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 7,
                          child: Icon(Icons.arrow_forward_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 1.0),
          Container(
            width: 350.0,
            height: 50.0,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 7,
                        child: Icon(Icons.thumbs_up_down),
                      ),
                      Positioned(
                        left: 40,
                        top: 10,
                        child: Text(
                          'Review',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 7,
                        child: Icon(Icons.arrow_forward_outlined),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 1.0),
          GestureDetector(
            onTap: _recommend,
            child: Container(
              width: 350.0,
              height: 50.0,
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
              child: Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 7,
                          child: Icon(Icons.thumb_up),
                        ),
                        Positioned(
                          left: 40,
                          top: 10,
                          child: Text(
                            'Recommend',
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 7,
                          child: Icon(Icons.arrow_forward_outlined),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
