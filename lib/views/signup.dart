import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/views/addfriends.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController profilePictureController =
      TextEditingController();

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Sign up'),
            // Add form fields for username and profile picture selection
            // Username TextField
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            const SizedBox(height: 16.0), // Add some spacing

            // Add a button to navigate to the AddFriendsScreen
            ElevatedButton(
              onPressed: () {
                Get.to(() => const AddFriendsScreen());
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
