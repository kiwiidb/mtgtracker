import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';
import 'package:mtgtracker/controllers/search_deck_controller.dart';
import 'package:mtgtracker/models/deck.dart';
import 'package:mtgtracker/views/home.dart';

class PickDeckScreen extends StatelessWidget {
  const PickDeckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchDeckController());
    GameController gc = Get.put(GameController());
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GetX<SearchDeckController>(builder: (ctrl) {
            return Column(
              children: [
                TextField(
                  controller: ctrl.searchTextController,
                  decoration: const InputDecoration(
                    labelText: 'Commander',
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () async {
                    ctrl.search();
                  },
                  child: const Text('search'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ctrl.searchResult.length,
                    itemBuilder: (BuildContext context, int i) {
                      return InkWell(
                        onTap: () {
                          gc.players[gc.pickedPlayerIndex].currentDeck = Deck(
                              commander: ctrl.searchResult[i].commander,
                              imageUrl: ctrl.searchResult[i].imageUrl);
                          if (gc.pickedPlayerIndex == 3) {
                            gc.startGame();
                          }
                          Get.offAll(() => const Home());
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
                                    ctrl.searchResult[i].imageUrl ?? "",
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
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
                                Flexible(
                                  child: Text(
                                    ctrl.searchResult[i].commander ?? "",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
