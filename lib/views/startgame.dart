import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';
import 'package:mtgtracker/views/home.dart';

class PickPlayerScreen extends StatelessWidget {
  const PickPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameController ctrl = Get.put(GameController());
    var c = <Widget>[const Text('Who\'s playing?')];
    for (var i = 0; i < ctrl.allPlayers.length; i++) {
      c.add(InkWell(
        onTap: () {
          ctrl.players[ctrl.pickedPlayerIndex].name = ctrl.allPlayers[i].name;
          ctrl.players[ctrl.pickedPlayerIndex].profileImageUrl =
              ctrl.allPlayers[i].profileImageUrl;
          Get.offAll(const Home());
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
    return Scaffold(
      appBar: AppBar(),
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
