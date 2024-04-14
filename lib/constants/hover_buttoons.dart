import 'package:flutter/material.dart';

class Hover_Button extends StatefulWidget {
  final String text;
  final Color defaultcolor;
  final Color hovercolor;
  final VoidCallback ontap;
  final double fontsize;
  final double width;

  Hover_Button({
    required this.text,
    required this.defaultcolor,
    required this.hovercolor,
    required this.ontap,
    required this.fontsize,
    required this.width,
  });

  @override
  State<Hover_Button> createState() => _Hover_ButtonState();
}

class _Hover_ButtonState extends State<Hover_Button> {
  bool ish = false;
  @override
  Widget build(BuildContext context) {
    double pad = widget.width*0.01;
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
          padding:  EdgeInsets.symmetric(horizontal: pad),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                      width: 2,
                        color: ish ? widget.hovercolor : Colors.transparent
                    )
                )
            ),

            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                  fontSize: widget.fontsize,
                  fontWeight: FontWeight.w300,
                  color: ish ? widget.hovercolor : widget.defaultcolor
              ),
              child: Text(widget.text,
                softWrap: true,
                overflow: TextOverflow.visible,),
            ),
          ),
        ),
      ),

    );
  }
}
