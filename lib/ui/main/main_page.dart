import 'package:flutter/material.dart';

import 'component/badged_fab.dart';
import 'component/joke_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: const JokeCard(),
        ),
      ),
      floatingActionButton: const BadgedFab(),
    );
  }
}
