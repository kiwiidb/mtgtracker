class SubmitGameRequest {
  String? winner;
  String? player2;
  String? player3;
  String? player4;
  int? durationMinutes;
  String? winningDeckCommander;
  String? deck2Commander;
  String? deck3Commander;
  String? deck4Commander;
  String? description;

  SubmitGameRequest({
    this.winner,
    this.player2,
    this.player3,
    this.player4,
    this.winningDeckCommander,
    this.deck2Commander,
    this.deck3Commander,
    this.deck4Commander,
    this.description,
    this.durationMinutes,
  });

  SubmitGameRequest.fromJson(Map<String, dynamic> json) {
    winner = json['winner'];
    player2 = json['player2'];
    player3 = json['player3'];
    player4 = json['player4'];
    winningDeckCommander = json['winningDeckCommander'];
    deck2Commander = json['deck2Commander'];
    deck3Commander = json['deck3Commander'];
    deck4Commander = json['deck4Commander'];
    description = json['description'];
    durationMinutes = json['durationMinutes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['winner'] = winner;
    data['player2'] = player2;
    data['player3'] = player3;
    data['player4'] = player4;
    data['winningDeckCommander'] = winningDeckCommander;
    data['deck2Commander'] = deck2Commander;
    data['deck3Commander'] = deck3Commander;
    data['deck4Commander'] = deck4Commander;
    data['description'] = description;
    data['durationMinutes'] = durationMinutes;
    return data;
  }
}
