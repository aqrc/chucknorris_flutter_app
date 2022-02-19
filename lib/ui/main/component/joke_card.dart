import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/joke_state.dart';
import 'top_row.dart';

class JokeCard extends StatelessWidget {
  const JokeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joke = context.watch<JokeState>().joke;

    if (joke == null) return const Center(child: Text("Loading..."));

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => context.read<JokeState>().updateJoke(),
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
