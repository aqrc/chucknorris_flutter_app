import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_wm.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.read<MainWidgetModel>().updateJoke(),
      child: Center(
        child: AutoSizeText(
          context.watch<MainWidgetModel>().joke?.value ?? "Loading...",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}