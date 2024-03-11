import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mtgtracker/views/ranking.dart';
import 'package:mtgtracker/views/submit_result.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.to(const SubmitResultPage());
                },
                child: const Text("Submit result")),
            ElevatedButton(
                onPressed: () {
                  Get.to(const RankingPage());
                },
                child: const Text("Ranking"))
          ],
        ),
      ),
    );
  }
}
