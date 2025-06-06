import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation(this.delay, this.child, {super.key});

  @override
  Widget build(BuildContext context) {
    final animation = MovieTween()
      ..tween(
        'opacity',
        Tween(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 500),
      )
      ..tween(
        'translateY',
        Tween(begin: 120.0, end: 0.0),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutQuad,
      );

    return PlayAnimationBuilder<Movie>(
      tween: animation,
      duration: animation.duration,
      delay: Duration(milliseconds: (500 * delay).round()),
      builder: (context, value, _) {
        return Opacity(
          opacity: value.get('opacity'),
          child: Transform.translate(
            offset: Offset(0, value.get('translateY')),
            child: child,
          ),
        );
      },
    );
  }
}
