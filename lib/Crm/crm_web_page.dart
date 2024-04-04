import 'package:almanet/responsive/screens/desktop_body.dart';
import 'package:almanet/responsive/screens/mobile_body.dart';
import 'package:almanet/responsive/responsive.dart';

import 'package:flutter/material.dart';

class CRMPage extends StatefulWidget {
  const CRMPage({super.key});

  @override
  State<CRMPage> createState() => _CRMPageState();
}

class _CRMPageState extends State<CRMPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
        mobile: MobileBody(),
        desktop: DesktopBody(),
      ),
    );
  }
}
