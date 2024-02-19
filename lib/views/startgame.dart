import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';
import 'package:mtgtracker/views/game.dart';

class StartGameScreen extends StatelessWidget {
  const StartGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameController ctrl = Get.put(GameController());
    var c = <Widget>[const Text('Add friends for the game')];
    for (var i = 0; i < ctrl.usernameControllers.length; i++) {
      var index = i + 1;
      c.add(TextField(
        controller: ctrl.usernameControllers[i],
        decoration: InputDecoration(
          labelText: 'Player $index',
        ),
      ));
    }
    c.add(ElevatedButton(
      onPressed: () async {
        await ctrl.initializePlayers();
        Get.to(() => const GameCounterScreen());
      },
      child: const Text('Start Game'),
    ));
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: c,
          ),
        ),
      ),
    );
  }
}
