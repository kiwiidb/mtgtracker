import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/views/startgame.dart';
import 'dart:math' as math;

import '../controllers/gamecontroller.dart';

class GameCounterScreen extends StatelessWidget {
  const GameCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];
    for (int i = 0; i < 4; i++) {
      widgets.add(buildPlayerButtons(i));
    }
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets.sublist(0, 2),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgets.sublist(2, 4),
      ),
    ]);
  }
}

Widget buildPlayerButtons(int index) {
  GameController ctrl = Get.put(GameController());
  //todo find some clever formula or smth for these things
  var angle = math.pi / 2;
  var leftDelta = -1;
  var rightDelta = 1;
  if (index == 1 || index == 3) {
    angle = -math.pi / 2;
    leftDelta = 1;
    rightDelta = -1;
  }
  return Container(
    margin: const EdgeInsets.all(3),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20)),
    child: Center(
      child: Column(
        children: [
          Transform.rotate(
            angle: angle,
            child: SizedBox(
                height: 200,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    ctrl.pickedPlayerIndex = index;
                    Get.to(const PickPlayerScreen());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(ctrl.players[index].profileImageUrl,
                        fit: BoxFit.cover, errorBuilder: (BuildContext context,
                            Object exception, StackTrace? stackTrace) {
                      return const Icon(
                        Icons.person,
                        size: 75,
                        color: Colors.black,
                      );
                    }),
                  ),
                )),
          ),
          Stack(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: GetX<GameController>(builder: (ctrl) {
                  var lifeTotal = ctrl.players[index].lifeTotal;
                  return Center(
                    child: Transform.rotate(
                      angle: angle,
                      child: Text(
                        '$lifeTotal',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 80.0,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 200,
                width: 200,
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox.expand(
                        child: TextButton(
                          onPressed: () {
                            ctrl.updatePlayer(index, leftDelta);
                          },
                          child: Container(),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox.expand(
                        child: TextButton(
                          onPressed: () {
                            ctrl.updatePlayer(index, rightDelta);
                          },
                          child: Container(),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
