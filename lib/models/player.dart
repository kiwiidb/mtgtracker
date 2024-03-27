class Player {
  int id;
  int lifeTotal;
  String name;
  String profileImageUrl;
  late String deckName;
  List<String> decks;
  Player({name, profileImageUrl, decks, id})
      : lifeTotal = 40,
        deckName = "",
        name = "",
        decks = [],
        id = 0,
        profileImageUrl = "";
  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
        name: json['name'],
        profileImageUrl: json['profileImageUrl'],
        decks: json['decks'],
        id: json['id']);
  }
}

class AllPlayersResponse {
  final List<Player> players;
  AllPlayersResponse({required this.players});
  factory AllPlayersResponse.fromJson(List<dynamic> json) {
    return AllPlayersResponse(
        players: json.map((dynamic json) => Player.fromJson(json)).toList());
  }
}
