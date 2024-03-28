class Player {
  int? id;
  int lifeTotal = 40;
  String? name;
  String? profileImageUrl;
  List<String>? decks;

  Player({this.id, this.name, this.profileImageUrl, this.decks});

  Player.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    profileImageUrl = json['profileImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['profileImageUrl'] = profileImageUrl;
    return data;
  }
}
