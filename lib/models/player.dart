class Player {
  int lifeTotal;
  String name;
  String profileImageUrl;
  late String deckName;
  Player(
    this.name,
    this.profileImageUrl,
  )   : lifeTotal = 40,
        deckName = "";
}
