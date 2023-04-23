import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 10.0, horizontal: 25.0),
      child: Row(
        children: [
          Icon(
            Icons.account_circle_outlined,
            color: Colors.blue,
            size: 100.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Column(
              children: [
                Text(
                  user.displayName!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Text(
                  user.email!,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}