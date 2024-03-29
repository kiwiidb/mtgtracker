import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/models/ranking.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/player.dart';

class GameController extends GetxController {
  int pickedPlayerIndex = 0;
  var apiHost = "https://mtgserver.kwintendebacker.com";
  var players = <Player>[Player(), Player(), Player(), Player()].obs;
  var allPlayers = <Player>[].obs;

  var r = <Ranking>[].obs;

  var selectedIndex = 0.obs;

  TextEditingController gameDescriptionController =
      TextEditingController(text: "");

  @override
  void onInit() async {
    r.value = await getRanking();
    var ap = await getAllPlayers();
    allPlayers.value = ap;
    super.onInit();
  }

  void updatePlayer(int i, int lifeDelta) {
    players[i].lifeTotal += lifeDelta;
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

  submitResult() {}
}
