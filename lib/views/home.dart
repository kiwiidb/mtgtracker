import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtgtracker/controllers/gamecontroller.dart';
import 'package:mtgtracker/views/game.dart';
import 'package:mtgtracker/views/ranking.dart';
import 'package:mtgtracker/views/submit_result.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    GameController ctrl = Get.put(GameController());
    const List<Widget> widgetOptions = <Widget>[
      GameCounterScreen(),
      RankingPage(),
      SubmitResultPage()
    ];
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(ctrl.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_numbered),
            label: 'Ranking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Submit',
          ),
        ],
        currentIndex: ctrl.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: ctrl.onItemTapped,
      ),
    );
  }
}
