import 'package:flutter/material.dart';

class Hover_Button extends StatefulWidget {
  final String text;
  final Color defaultcolor;
  final Color hovercolor;
  final VoidCallback ontap;

  Hover_Button({
    required this.text,
    required this.defaultcolor,
    required this.hovercolor,
    required this.ontap,
});

  @override
  State<Hover_Button> createState() => _Hover_ButtonState();
}

class _Hover_ButtonState extends State<Hover_Button> {
  bool ish = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onEnter: (_) => setState(() {
        ish = true;
      }),
      onExit: (_) => setState(() {
        ish = false;
      }),
      child: InkWell(
        onTap: widget.ontap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
           style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: ish ? widget.hovercolor : widget.defaultcolor
          ),
            child: Text(widget.text,),
          ),
        ),
      ),

    );
  }
}
