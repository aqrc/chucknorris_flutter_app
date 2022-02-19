import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../network/model/joke.dart';

class TopRow extends StatelessWidget {
  const TopRow({
    Key? key,
    required this.joke,
  }) : super(key: key);

  final Joke joke;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...(joke.categories.isEmpty
            ? [const Chip(label: Text("uncategorized"))]
            : joke.categories.map((e) => Chip(label: Text(e))).toList()),
        Expanded(
          child: Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () => _launchURL(joke.url),
              icon: const Icon(Icons.open_in_browser),
            ),
          ),
        )
      ],
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
