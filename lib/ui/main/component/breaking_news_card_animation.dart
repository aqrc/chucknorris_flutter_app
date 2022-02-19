import 'package:flutter/material.dart';

import 'joke_card.dart';

class BreakingNewsCardAnimation extends StatefulWidget {
  const BreakingNewsCardAnimation({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BreakingNewsCardAnimationState();
}

class _BreakingNewsCardAnimationState extends State<BreakingNewsCardAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
    value: 1,
  );
  late final Animation<double> _scaleAnimation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInQuint,
  );
  late final Animation<double> _rotationAnimation =
      Tween<double>(begin: 0, end: 2).animate(
    CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _rotationAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: JokeCard(_controller),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
