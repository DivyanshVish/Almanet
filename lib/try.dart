import 'package:almanet/constants/Fade_Info.dart';
import 'package:almanet/screens/pages/Login.dart';
import 'package:almanet/screens/pages/Sign_Up.dart';
import 'package:almanet/constants/home_services.dart';
import 'package:almanet/constants/hover_buttoons.dart';
import 'package:almanet/try.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';
import 'firebase_options.dart';

class AnimatedWidgetColumn extends StatefulWidget {
  final String title;
  final AssetImage image;
  final String desc;
  final VoidCallback ontap;



  AnimatedWidgetColumn({
    required this.title,
    required this.image,
    required this.desc,
    required this.ontap,
});

  @override
  _AnimatedWidgetColumnState createState() => _AnimatedWidgetColumnState();
}

class _AnimatedWidgetColumnState extends State<AnimatedWidgetColumn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late ScrollController _scrollController;
  late bool _isVisible;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.forward();
    _scrollController = ScrollController();
    _isVisible = false;
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isVisible) return;

    // Check if any part of the item is within the viewport
    if (_scrollController.position.pixels > 0 &&
        _scrollController.position.pixels <
            _scrollController.position.maxScrollExtent) {
      _controller.forward(); // Play the animation
      setState(() {
        _isVisible = true;
      });
    }
  }
  @override
  void dispose() {
    _controller.dispose();
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double ww = Get.width;
    double fs = ww*0.0165;
    double hh = Get.height;
    return Material(
      child: SizedBox(
        width: ww*0.2,
        height: hh*0.6,
        child: Column(
          children: [
              FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(
              (1 / 4) ,
              1.0,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        child: Text(widget.title,
        style: TextStyle(color: Colors.indigo.shade900, fontSize: 30,fontWeight: FontWeight.bold ),softWrap: true, maxLines: 3, overflow: TextOverflow.ellipsis,)
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: hh*0.01),
              child: FadeTransition(
                opacity: Tween<double>(
                  begin: 0,
                  end: 1,
                ).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: const Interval(
                      (1 / 4) ,
                      1.0,
                      curve: Curves.easeInOut,
                    ),
                  ),
                ),
                child: Image(image: widget.image,)
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: hh*0.01, bottom:  hh*0.01, right: ww*0.04),
              child: FadeTransition(
                  opacity: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(
                        (1 / 4) ,
                        1.0,
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),
                  child:Text(widget.desc, style: TextStyle(fontSize: ww*0.008), softWrap: true, maxLines: 4, overflow: TextOverflow.ellipsis,)
              ),
            ),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: hh*0.01),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FadeTransition(
                    opacity: Tween<double>(
                      begin: 0,
                      end: 1,
                    ).animate(
                      CurvedAnimation(
                        parent: _controller,
                        curve: const Interval(
                          (1 / 4) ,
                          1.0,
                          curve: Curves.easeInOut,
                        ),
                      ),
                    ),
                    child: Hover_Button(
                      defaultcolor: Colors.green,
                      hovercolor: Colors.green,
                      width: ww,
                      text: 'Read More >',
                      ontap: (){},
                      fontsize: ww*0.01
                    )
                ),
              ),
            ),


          ]
          ),
      ),
      );

  }
}