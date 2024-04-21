import 'package:almanet/constants/bulletitem.dart';
import 'package:flutter/material.dart';
import 'package:almanet/screens/styles.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Sap_ABAP extends StatefulWidget {
  const Sap_ABAP({super.key});

  @override
  State<Sap_ABAP> createState() => _Sap_ABAPState();
}

class _Sap_ABAPState extends State<Sap_ABAP> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      double ww = Get.width;
      double hh = Get.height;
      return sliverappbar_collapsed(child:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: ww,
              height: hh*0.35,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/sap_abap/img.png'),
                  fit: BoxFit.fill
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('SAP Development', style: TextStyle(fontSize: ww*0.017, fontWeight: FontWeight.bold, color: Colors.white),),
                  Text('Home / SAP Development', style: TextStyle(fontSize: ww*0.008,  color: Colors.white),)
                ],
              ),

            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: ww*0.2, vertical: hh*0.05),child: Text(
              'ERP Experts is not a service company. It is its clients’ strategic partner. We are providing expertise in a number of industries including industrial manufacturing, Oil & Gas, Utilities, etc. We aim to equip our customers with the power to have control of their organization with the help of SAP. We help them in a smooth transition to SAP. We provide SAP Basis Services so that the clientele could see some tangible business benefits right from the start. These services include:',
              style: TextStyle(fontSize: ww*0.0095), softWrap: true,maxLines: 3,
            ),),
            Container(
              width: ww,
              height: hh*0.06,
              decoration: BoxDecoration(
                color: Color(0xFF405C84),

              ),
            child: Padding(
              padding:  EdgeInsets.only(top: ww*0.005),
              child: Text('Our Services', textAlign: TextAlign.center,style: TextStyle(
                color: Colors.white,
                fontSize: ww*0.015,
                fontWeight: FontWeight.bold
              ),),
            ),
            ),
            Container(
            width: ww,

              color: Colors.grey.shade300,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: ww*0.2, vertical: hh*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: ww*0.3,
                      height: hh*0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BulletText(text: 'SAP Product and Service Support',height:  hh),
                          BulletText(text: 'Transport Management',height:  hh),
                          BulletText(text: 'SAP, JAVA & ABAP Application Support',height:  hh),
                          BulletText(text: 'SAP Architecture Management', height: hh),
                          BulletText(text: 'SAP Implementation & Support Operations', height: hh),
                          BulletText(text: 'SAP Application Infrastructure Services', height: hh),
                          BulletText(text: 'SAP Database Management', height: hh),
                          BulletText(text: 'Engineering and Technical Support Services', height: hh),




                        ],
                      ),
                    ),
                    Container(
                      width: ww*0.3,
                      height: hh*0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BulletText(text: 'Monitoring based on SOX requirements', height: hh),
                          BulletText(text: 'SAP Security-GRC & SOD',height:  hh),
                          BulletText(text: 'Data Center Facilities', height: hh),
                          BulletText(text: 'Managed Server & Storage-Component Lifecycle',height:  hh),
                          BulletText(text: 'Component Operations Management', height: hh),
                          BulletText(text: 'Data Back-up and Restore Management', height: hh),
                          BulletText(text: 'Managed Storage-Service Availability & Management', height: hh),
                          BulletText(text: 'Storage Operations',height:  hh),




                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: ww*0.2, vertical: hh*0.07), child: Text('Clients didn’t have to choose the whole end-to-end implementation package. They choose one, all, or a combination of the above-mentioned service components. We have economies of scale and leveraging the fact, we provide enhanced solution delivery and services in:',
            textAlign: TextAlign.center,),),
            Container(
              width: ww,
              height: hh*0.06,
              decoration: BoxDecoration(
                color: Color(0xFF405C84),

              ),
              child: Padding(
                padding:  EdgeInsets.only(top: ww*0.005),
                child: Text('Our Key Offerings', textAlign: TextAlign.center,style: TextStyle(
                    color: Colors.white,
                    fontSize: ww*0.015,
                    fontWeight: FontWeight.bold
                ),),
              ),
            ),
            Container(
              width: ww,
              height: hh*0.3,
              color: Colors.grey.shade300,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: ww*0.2, vertical: hh*0.01),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: ww*0.27,
                      height: hh*0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BulletText(text: 'Advanced ABAP development', height: hh,),
                          BulletText(text:  'SAP Scripts, Dialog Programming, Batch Data communications', height: hh),
                          BulletText(text:  'User Exits, Customer Exits, BAdIs, RFCs, Reports, BAPIs, LSMW, Workflow, ALE/IDOC across all modules in SAP', height: hh),
                          BulletText(text:  'Menu Painter, Screen Painter and Enhancements', height: hh),
                          BulletText(text:  'Implementing Cross Applications-ALE (IDOC generation) and Inbound /Outbound Interfaces', height: hh),




                        ],
                      ),
                    ),
                    Container(
                      width: ww*0.3,
                      height: hh*0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BulletText(text: 'Software Development Life Cycle', height:  hh),
                          BulletText(text: 'Use of Data Migration tools such as BDC’S and LSMW, and ETL tools like CranSoft, BODS',height:   hh),
                          BulletText(text: 'BSP Programming and WebUI Customization', height:  hh),
                          BulletText(text: 'ABAP Webdynpro Programming', height:  hh),
                          BulletText(text: 'SAP Portal and BI programming', height: hh),
                          BulletText(text: 'Adobe forms and Interactive Forms', height:  hh),




                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),


            Web_footer()

          ],
        ),
      ));
    });
  }
}
