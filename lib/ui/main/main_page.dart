import 'package:flutter/material.dart';

import 'component/badged_fab.dart';
import 'component/breaking_news_card_animation.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.greenAccent,
          padding: const EdgeInsets.all(10),
          child: const BreakingNewsCardAnimation(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const BadgedFab(),
    );
  }
}
