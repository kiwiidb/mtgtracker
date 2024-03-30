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
    return Stack(
      children: [
        GridView.count(
          childAspectRatio: 0.50,
          crossAxisCount: 2,
          children: widgets,
        ),
        Center(
          child: GetX<GameController>(builder: (ctrl) {
            var prefix = "";
            var secPrefix = "";

            int mins = ctrl.seconds ~/ 60;
            if (mins < 10) {
              prefix = "0";
            }

            int secs = ctrl.seconds.value % 60;
            if (secs < 10) {
              secPrefix = "0";
            }
            return Text(
              "$prefix$mins:$secPrefix$secs",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
          }),
        ),
      ],
    );
  }
}

Widget buildPlayerButtons(int index) {
  //todo find some clever formula or smth for these things
  var angle = math.pi / 2;
  var leftDelta = -1;
  var rightDelta = 1;
  if (index == 1 || index == 3) {
    angle = -math.pi / 2;
    leftDelta = 1;
    rightDelta = -1;
  }
  return GetX<GameController>(builder: (ctrl) {
    return Center(
      child: Column(
        children: [
          Transform.rotate(
            angle: angle,
            child: SizedBox(
                height: 200,
                width: 200,
                child: TextButton(
                  onLongPress: () {},
                  onPressed: () {
                    ctrl.pickedPlayerIndex = index;
                    Get.to(() => const PickPlayerScreen());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(children: [
                      Image.network(ctrl.players[index].profileImageUrl ?? "",
                          fit: BoxFit.cover, errorBuilder:
                              (BuildContext context, Object exception,
                                  StackTrace? stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 75,
                          color: Colors.black,
                        );
                      }),
                      SizedBox(
                        height: 50,
                        child: Image.network(
                            ctrl.players[index].currentDeck?.imageUrl ?? "",
                            fit: BoxFit.cover, errorBuilder:
                                (BuildContext context, Object exception,
                                    StackTrace? stackTrace) {
                          return const SizedBox(
                            height: 50,
                          );
                        }),
                      )
                    ]),
                  ),
                )),
          ),
          Stack(
            children: [
              GetX<GameController>(builder: (ctrl) {
                var p = ctrl.players[index];
                var lifeTotal = p.lifeTotal;
                var t = '$lifeTotal';
                var poison = p.poisonCounters;

                var c = [
                  Text(
                    t,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80.0,
                    ),
                  ),
                ];
                if (poison > 0) {
                  c.add(Text(
                    '$poison',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ));
                }
                return Center(
                  child: Transform.rotate(
                    angle: angle,
                    child: Column(
                      children: c,
                    ),
                  ),
                );
              }),
              SizedBox(
                height: 150,
                width: 200,
                child: Row(
                  children: [
                    Flexible(
                      child: SizedBox.expand(
                        child: TextButton(
                          onLongPress: () {
                            ctrl.updatePlayer(index, leftDelta, true);
                          },
                          onPressed: () {
                            ctrl.updatePlayer(index, leftDelta, false);
                          },
                          child: Container(),
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox.expand(
                        child: TextButton(
                          onPressed: () {
                            ctrl.updatePlayer(index, rightDelta, false);
                          },
                          onLongPress: () {
                            ctrl.updatePlayer(index, rightDelta, true);
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
    );
  });
}
