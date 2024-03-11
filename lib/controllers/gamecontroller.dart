import 'package:get/get.dart';

import '../models/player.dart';

class GameController extends GetxController {
  int pickedPlayerIndex = 0;
  var players = <Player>[
    Player("", ""),
    Player("", ""),
    Player("", ""),
    Player("", "")
  ].obs;
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
        'https://raw.githubusercontent.com/kiwiidb/mtgserver/main/res/images/brain.jpg'),
    Player('Kwinten', 'https://kwintendebacker.com/images/foto.jpg'),
  ];

  var selectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updatePlayer(int i, int lifeDelta) {
    players[i].lifeTotal += lifeDelta;
    players.refresh();
  }

  void onItemTapped(int value) {
    selectedIndex.value = value;
  }
}
