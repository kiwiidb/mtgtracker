import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';

class SubmitResultPage extends StatelessWidget {
  const SubmitResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    var labels = [
      const Text("Winner"),
      const Text("2nd place"),
      const Text("3rd place"),
      const Text("4th place")
    ];
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetX<GameController>(builder: (ctrl) {
            var rankedPlayersInGame = ctrl.inGameRankedPlayers();
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    itemCount: ctrl.players.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 75,
                                    height: 75,
                                    child: Image.network(
                                      rankedPlayersInGame[index]
                                              .profileImageUrl ??
                                          "",
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return const Icon(
                                          Icons.person,
                                          size: 75,
                                          color: Colors.black,
                                        );
                                      },
                                    ),
                                  ),
                                  const SizedBox(width: 16.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      labels[index],
                                      Text(
                                        rankedPlayersInGame[index].name ?? "",
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(
                                        width: 180,
                                        child: Text(
                                          rankedPlayersInGame[index]
                                                  .currentDeck
                                                  ?.commander ??
                                              "",
                                          style: const TextStyle(fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                TextField(
                  controller: ctrl.gameDescriptionController,
                  decoration: const InputDecoration(
                    labelText: 'game comments',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await ctrl.submitAndToRanking();
                  },
                  child: const Text('Submit result'),
                ),
              ],
            );
          }),
        ));
  }
}
