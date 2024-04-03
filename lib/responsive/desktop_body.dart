import 'package:flutter/material.dart';

import '../constants/hover_buttoons.dart';

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 20),
      //padding: const EdgeInsets.only(right: 8.0, top: 5),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CRM",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                text: 'Sales',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: 23,
                width: 0,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                text: 'Reporting',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: 23,
                width: 0,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                text: 'Configuration',
                defaultcolor: Colors.grey.shade600,
                hovercolor: Colors.blue,
                ontap: () {},
                fontsize: 23,
                width: 0,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              child: const Padding(
                padding: EdgeInsetsDirectional.only(end: 20),
                child: Icon(Icons.settings),
              ),
              onTap: () {},
            )
          ],
          leading: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.dehaze_rounded,
                size: 35,
              )),
        ),
      ),
    );
  }
}
