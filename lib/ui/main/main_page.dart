import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'component/badged_fab.dart';
import 'main_wm.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => context.read<MainWidgetModel>().updateJoke(),
            child: Center(
              child: AutoSizeText(
                context.watch<MainWidgetModel>().joke,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const BadgedFab(),
    );
  }
}
