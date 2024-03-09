class Player {
  late int index;
  late int lifeTotal;
  String name;
  String profileImageUrl;
  late String deckName;
  Player(this.name, this.profileImageUrl,
      {index = 0, lifeTotal = 40, deckName = ""});
}
