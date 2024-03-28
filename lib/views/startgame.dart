import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';
import 'package:mtgtracker/views/home.dart';

class PickPlayerScreen extends StatelessWidget {
  const PickPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameController ctrl = Get.put(GameController());
    var c = <Widget>[const Text('Who\'s playing?')];
    for (var i = 0; i < ctrl.allPlayers.length; i++) {
      c.add(InkWell(
        onTap: () {
          ctrl.players[ctrl.pickedPlayerIndex].name = ctrl.allPlayers[i].name;
          ctrl.players[ctrl.pickedPlayerIndex].profileImageUrl =
              ctrl.allPlayers[i].profileImageUrl;
          Get.offAll(const Home());
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.network(
                    ctrl.allPlayers[i].profileImageUrl!,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16.0),
                Text(
                  ctrl.allPlayers[i].name!,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ));
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: GetX<GameController>(builder: (ctrl) {
            return ListView.builder(
              itemCount: ctrl.allPlayers.length + 1,
              itemBuilder: (BuildContext context, int i) {
                if (i == 0) {
                  return const Text('Who\'s playing?');
                }
                return InkWell(
                  onTap: () {
                    ctrl.players[ctrl.pickedPlayerIndex].name =
                        ctrl.allPlayers[i - 1].name;
                    ctrl.players[ctrl.pickedPlayerIndex].profileImageUrl =
                        ctrl.allPlayers[i - 1].profileImageUrl;
                    Get.offAll(const Home());
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 75,
                            height: 75,
                            child: Image.network(
                              ctrl.allPlayers[i - 1].profileImageUrl ?? "",
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  size: 75,
                                  color: Colors.black,
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Text(
                            ctrl.allPlayers[i - 1].name ?? "",
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
