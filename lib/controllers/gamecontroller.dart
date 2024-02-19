import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/player.dart';

class GameController extends GetxController {
  var players = <Player>[].obs;
  var usernameControllers = <TextEditingController>[];

  @override
  void onInit() {
    usernameControllers.addAll([
      TextEditingController(text: "Player 1"),
      TextEditingController(text: "Player 2"),
      TextEditingController(text: "Player 3"),
      TextEditingController(text: "Player 4"),
    ]);
    super.onInit();
  }

  void updatePlayer(int i, int lifeDelta) {
    players[i].lifeTotal += lifeDelta;
    players.refresh();
  }

  void reset() {
    for (var p in players) {
      p.lifeTotal = 40;
    }
  }

  initializePlayers() {
    for (var i = 0; i < usernameControllers.length; i++) {
      players.add(Player(i, 40, usernameControllers[i].text, "somedeck"));
    }
  }
}
