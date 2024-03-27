import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ranking"),
      ),
      body: GetX<GameController>(builder: (ctrl) {
        return ListView.builder(
          itemCount: ctrl.r.length,
          itemBuilder: (BuildContext context, int index) {
            var wins = ctrl.r[index].wins;
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
                            ctrl.r[index].profileImageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          ctrl.r[index].name,
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    Text(
                      "Wins: $wins",
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
