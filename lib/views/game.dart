import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/views/startgame.dart';
import 'dart:math' as math;

import '../controllers/gamecontroller.dart';

class GameCounterScreen extends StatelessWidget {
  const GameCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GameController ctrl = Get.put(GameController());
    var widgets = <Widget>[];
    for (var p in ctrl.players) {
      widgets.add(buildPlayerButtons(p.index));
    }
    return Scaffold(
      body: Stack(
        children: [
          GridView.count(
            childAspectRatio: (0.5),
            crossAxisCount: 2,
            children: widgets,
          ),
          Center(
            child: SizedBox(
              height: 106,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  TextButton(
                      onPressed: () {
                        Get.offAll(() => const StartGameScreen());
                        ctrl.reset();
                      },
                      child: const Icon(
                        Icons.refresh,
                        size: 50,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
    child: Stack(
      children: <Widget>[
        GetX<GameController>(builder: (ctrl) {
          var lifeTotal = ctrl.players[index].lifeTotal;
          return Transform.rotate(
            angle: angle,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ctrl.players[index].name),
                    Text(
                      '$lifeTotal',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 50.0,
                      ),
                    ),
                  ]),
            ),
          );
        }),
        Row(
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
        )
      ],
    ),
  );
}
