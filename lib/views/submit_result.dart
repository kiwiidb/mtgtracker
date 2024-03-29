import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';

class SubmitResultPage extends StatelessWidget {
  const SubmitResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    GameController ctrl = Get.put(GameController());
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
          child: Column(
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
                                    ctrl.players[index].profileImageUrl ?? "",
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
                                  children: [
                                    labels[index],
                                    Text(
                                      ctrl.players[index].name ?? "",
                                      style: const TextStyle(fontSize: 20),
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
                  await ctrl.submitResult();
                },
                child: const Text('Submit result'),
              ),
            ],
          ),
        ));
  }
}
