class Deck {
  String? commander;
  String? imageUrl;

  Deck({
    this.commander,
    this.imageUrl,
  });

  Deck.fromJson(Map<String, dynamic> json) {
    commander = json['commander'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['commander'] = commander;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
