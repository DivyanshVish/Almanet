import 'package:flutter/material.dart';

import '../../../constants/hover_buttoons.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 8.0,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "CRM",
            style: TextStyle(
              fontSize: 30,
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
                size: 32,
              )),
        ),
      ),
    );
  }
}
