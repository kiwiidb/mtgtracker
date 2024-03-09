import 'package:get/get.dart';

import '../models/player.dart';

class GameController extends GetxController {
  var players = <Player>[].obs;
  final List<Player> allPlayers = [
    Player('Alex',
        'https://raw.githubusercontent.com/kiwiidb/mtgserver/main/res/images/alex.jpg'),
    Player('Lucas',
        'https://raw.githubusercontent.com/kiwiidb/mtgserver/main/res/images/lucas.jpg'),
    Player('Lorin',
        'https://raw.githubusercontent.com/kiwiidb/mtgserver/main/res/images/lorin.jpg'),
    Player('Arthur',
        'https://tomcat.elis.ugent.be/static/elisall/personeel/thumbnails/AV014.jpeg'),
    Player('Dries',
        'https://raw.githubusercontent.com/kiwiidb/mtgserver/main/res/images/dries.png'),
    Player('Braïn',
        'https://raw.githubusercontent.com/kiwiidb/mtgserver/main/res/images/lorin.jpg'),
    Player('Kwinten', 'https://kwintendebacker.com/images/foto.jpg'),
  ];

  @override
  void onInit() {
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
    for (var i = 0; i < 4; i++) {
      var p = allPlayers[i];
      p.index = i;
      p.lifeTotal = 40;
      players.add(p);
    }
  }
}
