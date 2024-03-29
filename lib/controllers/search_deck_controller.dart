import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/models/deck.dart';
import 'package:mtgtracker/models/scryfall_search_result.dart';
import 'package:http/http.dart' as http;

class SearchDeckController extends GetxController {
  var apiHost = "https://api.scryfall.com";

  TextEditingController searchTextController = TextEditingController(text: "");

  List<Deck> searchResult = <Deck>[].obs;

  void clearResult() {
    searchResult.removeWhere((element) => true);
  }

  void search() async {
    clearResult();
    var res = await searchScryFall(searchTextController.text);
    for (var r in res.data!) {
      searchResult.add(Deck(commander: r.name, imageUrl: r.imageUris?.artCrop));
    }
  }

  Future<ScryFallSearchResult> searchScryFall(String query) async {
    final response = await http.get(Uri.parse('$apiHost/cards/search')
        .replace(queryParameters: {"q": query}));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      final jsonResponse = jsonDecode(response.body);
      return ScryFallSearchResult.fromJson(jsonResponse);
    } else {
      // If the server did not return a 200 OK response, throw an exception
      throw Exception('Failed to load data');
    }
  }
}
