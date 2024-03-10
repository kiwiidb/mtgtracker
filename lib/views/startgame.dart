import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';
import 'package:mtgtracker/views/game.dart';

class StartGameScreen extends StatelessWidget {
  const StartGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameController ctrl = Get.put(GameController());
    var c = <Widget>[const Text('Who\'s playing?')];
    for (var i = 0; i < ctrl.allPlayers.length; i++) {
      c.add(InkWell(
        onTap: () {
          var p = ctrl.allPlayers[i];
          p.index = ctrl.players.length;
          p.lifeTotal = 40;
          ctrl.players.add(p);
        },
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  child: Image.network(
                    ctrl.allPlayers[i].profileImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.0),
                Text(
                  ctrl.allPlayers[i].name,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    c.add(ElevatedButton(
      onPressed: () async {
        Get.to(() => const GameCounterScreen());
      },
      child: const Text('Start Game'),
    ));
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: ListView(
            children: c,
          ),
        ),
      ),
    );
  }
}
