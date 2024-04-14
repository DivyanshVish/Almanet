import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home_Services extends StatefulWidget {
  final String Title;
  final String Description;
  final VoidCallback ontap;

  Home_Services({
    required this.Title,
    required this.Description,
    required this.ontap,
  });

  @override
  State<Home_Services> createState() => _Home_ServicesState();
}

class _Home_ServicesState extends State<Home_Services> {
  @override
  Widget build(BuildContext context) {
    double ww = Get.width;
    double fs = ww * 0.0165;
    double hh = Get.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ww * 0.01),
      child: Container(
        width: ww * 0.12,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.Title,
              style: TextStyle(color: Colors.green, fontSize: ww * 0.011, fontWeight: FontWeight.bold, decoration: TextDecoration.none),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: hh * 0.04),
              child: Text(
                widget.Description,
                overflow: TextOverflow.visible,
                softWrap: true,
                style: TextStyle(fontSize: ww * 0.0085, color: Colors.black, decoration: TextDecoration.none),
              ),
            ),
            SizedBox(
              height: hh * 0.03,
              width: ww * 0.1,
              child: ElevatedButton(
                onPressed: widget.ontap,
                child: Text(
                  'Learn More',
                  style: TextStyle(color: Colors.black, fontSize: ww * 0.0085),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.hovered)) {
                      return Colors.green; // Change color when hovered
                    }
                    return Colors.white; // Default color
                  }),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.green, width: 1),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
