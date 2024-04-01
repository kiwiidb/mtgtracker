import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/models/ranking.dart';
import 'package:http/http.dart' as http;
import 'package:mtgtracker/models/submit_game_request.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'dart:math';
import 'dart:async';
import 'dart:convert';

import '../models/player.dart';

class GameController extends GetxController {
  int pickedPlayerIndex = 0;
  int nrPickedPlayers = 0;
  var apiHost = "https://mtgserver.kwintendebacker.com";
  var players = <Player>[Player(), Player(), Player(), Player()].obs;
  var allPlayers = <Player>[].obs;
  var seconds = 0.obs;
  final sw = Stopwatch();

  var r = <Ranking>[].obs;

  var selectedIndex = 0.obs;

  TextEditingController gameDescriptionController =
      TextEditingController(text: "");

  List<Player> inGameRankedPlayers() {
    List<Player> copy = List.from(players);
    copy.sort((a, b) => b.lifeTotal.compareTo(a.lifeTotal));
    return copy;
  }

  void resetGame() {
    players.value = <Player>[Player(), Player(), Player(), Player()];
  }

  @override
  void onInit() async {
    WakelockPlus.enable();
    r.value = await getRanking();
    var ap = await getAllPlayers();
    allPlayers.value = ap;
    super.onInit();
  }

  void updatePlayer(int i, int delta, bool isPoison) {
    if (isPoison) {
      players[i].poisonCounters += delta;
      players.refresh();
      return;
    }
    players[i].lifeTotal += delta;
    players.refresh();
  }

  void onItemTapped(int value) {
    selectedIndex.value = value;
  }

  Future<List<Ranking>> getRanking() async {
    final response = await http.get(Uri.parse('$apiHost/ranking'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = jsonDecode(response.body);
      return RankingResponse.fromJson(jsonResponse).ranking;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load data');
    }
  }

  Future<List<Player>> getAllPlayers() async {
    final response = await http.get(Uri.parse('$apiHost/players'));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      Iterable b = jsonDecode(response.body);
      List<Player> res = List<Player>.from(b.map((e) => Player.fromJson(e)));
      return res;
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load data');
    }
  }

  submitAndToRanking() async {
    await submitResult();
    r.value = await getRanking();
    selectedIndex.value = 1;
    resetGame();
  }

  submitResult() async {
    sw.stop();
    var elapsed = sw.elapsed.inMinutes;
    var req = SubmitGameRequest(
      winner: inGameRankedPlayers()[0].name,
      player2: inGameRankedPlayers()[1].name,
      player3: inGameRankedPlayers()[2].name,
      player4: inGameRankedPlayers()[3].name,
      description: gameDescriptionController.text,
      durationMinutes: elapsed,
      winningDeckCommander: inGameRankedPlayers()[0].currentDeck?.commander,
      deck2Commander: inGameRankedPlayers()[1].currentDeck?.commander,
      deck3Commander: inGameRankedPlayers()[2].currentDeck?.commander,
      deck4Commander: inGameRankedPlayers()[3].currentDeck?.commander,
    );
    var body = req.toJson();
    var resp = await http.post(
      Uri.parse('$apiHost/games'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (resp.statusCode != 201) {
      throw Exception('Failed to submit result');
    }
  }

  void startGame() {
    var r = Random().nextInt(4);
    var name = players[r].name;
    var msg = "";
    if (name == "Lucas") {
      msg = "Of course he does..";
    }
    Get.snackbar("$name starts the game!", msg,
        snackPosition: SnackPosition.TOP, duration: const Duration(seconds: 5));
    Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds.value++;
    });
    sw.start();
  }

  String getFormattedTime(int secs) {
    var prefix = "";
    var secPrefix = "";

    int mins = secs ~/ 60;
    if (mins < 10) {
      prefix = "0";
    }

    int seconds = secs % 60;
    if (seconds < 10) {
      secPrefix = "0";
    }
    return "$prefix$mins:$secPrefix$seconds";
  }
}
