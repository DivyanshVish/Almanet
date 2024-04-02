import 'package:almanet/hover_buttoons.dart';

import 'package:flutter/material.dart';

class CRMPage extends StatelessWidget {
  const CRMPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, top: 5),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "CRM",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Hover_Button(
              text: 'Sales',
              defaultcolor: Colors.grey.shade600,
              hovercolor: Colors.blue,
              ontap: () {},
              fontsize: 23,
              width: 0,
            ),
            const SizedBox(
              width: 5,
            ),
            Hover_Button(
              text: 'Reporting',
              defaultcolor: Colors.grey.shade600,
              hovercolor: Colors.blue,
              ontap: () {},
              fontsize: 23,
              width: 0,
            ),
            const SizedBox(
              width: 5,
            ),
            Hover_Button(
              text: 'Configuration',
              defaultcolor: Colors.grey.shade600,
              hovercolor: Colors.blue,
              ontap: () {},
              fontsize: 23,
              width: 0,
            ),
            const SizedBox(
              width: 5,
            ),
            InkWell(
              child: const Icon(Icons.settings),
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
