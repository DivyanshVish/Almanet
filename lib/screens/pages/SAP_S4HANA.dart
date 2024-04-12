import 'package:almanet/Crm/crm_web_page.dart';
import 'package:almanet/constants/Fade_Info.dart';
import 'package:almanet/screens/pages/Login.dart';
import 'package:almanet/screens/pages/Sign_Up.dart';
import 'package:almanet/constants/home_services.dart';
import 'package:almanet/constants/hover_buttoons.dart';
import 'package:almanet/screens/styles.dart';
import 'package:almanet/try.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hovering/hovering.dart';



class sap_s4hana extends StatefulWidget {
  const sap_s4hana({super.key});

  @override
  State<sap_s4hana> createState() => _sap_s4hanaState();
}

class _sap_s4hanaState extends State<sap_s4hana> {
  double ww = Get.width;
  double hh = Get.height;
  @override
  Widget build(BuildContext context) {
    return sliverappbar_collapsed(child: SingleChildScrollView(
      child: Container(
        width: ww,
        height: hh*0.6,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hana.png'),
            fit: BoxFit.fill
          )
        ),
        child: Center(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    ));
  }
}
