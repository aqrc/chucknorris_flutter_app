import 'package:auto_size_text/auto_size_text.dart';
import 'package:chucknorris/network/model/joke.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_wm.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joke = context.watch<MainWidgetModel>().joke;

    if (joke == null) return const Center(child: Text("Loading..."));

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.read<MainWidgetModel>().updateJoke(),
      child: Card(
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TopRow(joke: joke),
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    joke.value,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
    required this.joke,
  }) : super(key: key);

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: joke.categories.isEmpty
          ? [const Chip(label: Text("uncategorized"))]
          : joke.categories.map((e) => Chip(label: Text(e))).toList(),
    );
  }
}
