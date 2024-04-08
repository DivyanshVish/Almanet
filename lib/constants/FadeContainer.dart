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
  bool _isVisible1 = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('unique_key'),
      onVisibilityChanged: (visibilityInfo) {
        setState(() {
          _isVisible1 = visibilityInfo.visibleFraction > 0.5;
        });
      },
      child: AnimatedOpacity(
        opacity: _isVisible1 ? 1.0 : 0.0,
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



class FadeInContainer_footer extends StatefulWidget {
  final double height;
  final double width;
  final Widget child;
  final Duration duration;

  FadeInContainer_footer({
    required this.width,
    required this.height,
    required this.child,
    required this.duration,
  });
  @override
  _FadeInContainerState_footer createState() => _FadeInContainerState_footer();
}

class _FadeInContainerState_footer extends State<FadeInContainer_footer> {
  bool _isVisible2 = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('unique_key1'),
      onVisibilityChanged: (visibilityInfo) {
        setState(() {
          _isVisible2 = visibilityInfo.visibleFraction > 0.5;
        });
      },
      child: AnimatedOpacity(
        opacity: _isVisible2 ? 1.0 : 0.0,
        duration: widget.duration, // Adjust the duration as needed
        curve: Curves.easeInOut,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue.shade900, Colors.blue.shade50],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )
          ),
            width: widget.width,
            height: widget.height,
            child: widget.child
        ),
      ),
    );
  }
}