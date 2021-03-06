import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/joke_state.dart';
import 'top_row.dart';

class JokeCard extends StatelessWidget {
  final AnimationController _controller;

  const JokeCard(
    this._controller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var joke = context.watch<JokeState>().joke;

    if (joke == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () async {
        await _controller.reverse(from: 1);
        await context.read<JokeState>().updateJoke();
        await _controller.forward(from: 0);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
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
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
