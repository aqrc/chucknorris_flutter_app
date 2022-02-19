import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'component/badged_fab.dart';
import 'component/breaking_news_card_animation.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.blue,
        ),
      ),
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
