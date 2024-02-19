import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/views/startgame.dart';

class AddFriendsScreen extends StatelessWidget {
  const AddFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Friends'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Add friends here'),
            // Add a button to navigate to the StartGameScreen
            ElevatedButton(
              onPressed: () {
                Get.to(() => const StartGameScreen());
              },
              child: const Text('Start Game'),
            ),
          ],
        ),
      ),
    );
  }
}
