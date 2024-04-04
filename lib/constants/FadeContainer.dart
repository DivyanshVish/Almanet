import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FadeInContainer extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;
  final Color colour;
  final Duration duration;

  FadeInContainer({
    required this.width,
    required this.height,
    required this.child,
    required this.colour,
    required this.duration,
});
  @override
  _FadeInContainerState createState() => _FadeInContainerState();
}

class _FadeInContainerState extends State<FadeInContainer> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('unique_key'),
      onVisibilityChanged: (visibilityInfo) {
        setState(() {
          _isVisible = visibilityInfo.visibleFraction > 0.5;
        });
      },
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: widget.duration, // Adjust the duration as needed
        curve: Curves.easeInOut,
        child: Container(
          width: widget.width,
          height: widget.height,
          color: widget.colour,
          child: widget.child
        ),
      ),
    );
  }
}