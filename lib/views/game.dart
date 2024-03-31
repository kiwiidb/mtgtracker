import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/views/startgame.dart';
import 'dart:math' as math;

import '../controllers/gamecontroller.dart';

class GameCounterScreen extends StatelessWidget {
  const GameCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = Center(
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
    );
    var widgets = <Widget>[];
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    widgets.add(Row(children: [
      buildPlayerButtons(0, width, height),
      buildPlayerButtons(1, width, height)
    ]));
    widgets.add(counter);
    widgets.add(Row(children: [
      buildPlayerButtons(2, width, height),
      buildPlayerButtons(3, width, height)
    ]));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widgets,
    );
  }
}

Widget buildPlayerButtons(int index, double w, double h) {
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
                height: h / 5,
                width: w / 2,
                child: TextButton(
                  onLongPress: () {},
                  onPressed: () {
                    ctrl.pickedPlayerIndex = index;
                    Get.to(() => const PickPlayerScreen());
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          Image.network(
                              ctrl.players[index].profileImageUrl ?? "",
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
            alignment: AlignmentDirectional.center,
            children: [
              GetX<GameController>(builder: (ctrl) {
                var p = ctrl.players[index];
                var lifeTotal = p.lifeTotal;
                var t = '$lifeTotal';
                var poison = p.poisonCounters;

                var c = [
                  Text(
                    t,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80.0,
                    ),
                  ),
                ];
                if (poison > 0) {
                  c.add(Text(
                    '$poison',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ));
                }
                return Transform.rotate(
                  angle: angle,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: c,
                  ),
                );
              }),
              SizedBox(
                height: h / 5,
                width: w / 2,
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
