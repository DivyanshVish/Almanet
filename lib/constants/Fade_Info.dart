import 'package:flutter/material.dart';

class FadeInFromLeftToRight extends StatefulWidget {
  final List<Widget> widgets;
  final Duration duration;

  FadeInFromLeftToRight({required this.widgets, required this.duration});

  @override
  _FadeInFromLeftToRightState createState() => _FadeInFromLeftToRightState();
}

class _FadeInFromLeftToRightState extends State<FadeInFromLeftToRight> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> aa = widget.widgets;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: widget.widgets
          .asMap()
          .map((index, widget) => MapEntry(
                index,
                FadeTransition(
                  opacity: _animation.drive(
                    Tween<double>(
                      begin: 0.0,
                      end: 1.0,
                    ).chain(
                      CurveTween(
                        curve: Interval(
                          index * 1.0 / (aa.length),
                          1.0,
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                  ),
                  child: widget,
                ),
              ))
          .values
          .toList(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
