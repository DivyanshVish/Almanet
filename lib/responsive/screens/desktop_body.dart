import 'package:flutter/material.dart';

import '../../Crm/ButtonAndPopup.dart';


class DesktopBody extends StatefulWidget {
  const DesktopBody({Key? key}) : super(key: key);

  @override
  _DesktopBodyState createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {


  @override
  Widget build(BuildContext context) {
    return ButtonAndPopup(context);
  }


}
