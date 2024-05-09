// import 'dart:developer';

// import 'package:almanet/constants/dummy_data/option_for_creating%20_leads.dart';
// import 'package:almanet/responsive/provider/crm_provider.dart';
// import 'package:almanet/responsive/ui/screens/UpdateSCreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// class NewDesktop extends StatefulWidget {
//   const NewDesktop({super.key});

//   @override
//   State<NewDesktop> createState() => _NewDesktopState();
// }

// class _NewDesktopState extends State<NewDesktop> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: true,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: const Text(
//           "CRM",
//           style: TextStyle(
//             fontSize: 32,
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Material(
//                 child: InkWell(
//                   onTap: () {},
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12.0),
//                     child: Text("Sales"),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Material(
//                 child: InkWell(
//                   onTap: () {},
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12.0),
//                     child: Text("Reports"),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               Material(
//                 child: InkWell(
//                   onTap: () {},
//                   child: const Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 12.0),
//                     child: Text("Configuration"),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               IconButton(
//                 onPressed: () {},
//                 icon: const Icon(
//                   Icons.settings,
//                   color: Colors.black,
//                 ),
//                 splashRadius: 20,
//                 padding: EdgeInsets.zero,
//               ),
//             ],
//           ),
//         ],
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(
//             Icons.chevron_left,
//             size: 35,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Container(
//           height: 50,
//           width: 200,
//           decoration: BoxDecoration(
//             border: Border.all(width: 1, color: Colors.black54),
//             color: Colors.green,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: DropdownButton(
//               elevation: 0,
//               isExpanded: true,
//               underline: const SizedBox(),
//               padding: const EdgeInsets.symmetric(horizontal: 10),
//               hint: const Text(
//                 "Generate Leads",
//                 style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               items: OptionofLeadsNew.map((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(
//                     value,
//                     style: const TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 log(value.toString());
//                 context.read<CRMProvider>().selectedCompanyGroup = value;
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:almanet/constants/dummy_data/industries_dummy_data.dart';
import 'package:almanet/constants/dummy_data/option_for_creating%20_leads.dart';
import 'package:almanet/responsive/models/lead_model.dart';
import 'package:almanet/responsive/provider/crm_provider.dart';
import 'package:almanet/responsive/ui/screens/subleads/UpdateSCreen.dart';
import 'package:almanet/responsive/ui/screens/subleads/delet.dart';
import 'package:almanet/responsive/ui/screens/subleads/newleads.dart';
import 'package:almanet/responsive/ui/widgets/crm_list_tile.dart';
import 'package:almanet/responsive/ui/widgets/crm_popup_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class NewDesktop extends StatefulWidget {
  const NewDesktop({super.key});

  @override
  State<NewDesktop> createState() => _NewDesktopState();
}

class _NewDesktopState extends State<NewDesktop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "CRM",
          style: TextStyle(
            fontSize: 32,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Material(
                child: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Opportunities"),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Reports"),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Material(
                child: InkWell(
                  onTap: () {},
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text("Configuration"),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                splashRadius: 20,
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ],
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.chevron_left,
            size: 35,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //TODO: DropdownMenu
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black54),
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: DropdownMenu<String>(
                  enableFilter: true,
                  enableSearch: false,
                  textStyle: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                  width: 200,
                  inputDecorationTheme:
                      const InputDecorationTheme(border: InputBorder.none),
                  hintText: "Generate Leads",
                  onSelected: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {});
                  },
                  dropdownMenuEntries:
                      OptionofLeadsNew.map<DropdownMenuEntry<String>>(
                          (String value) {
                    return DropdownMenuEntry<String>(
                        value: value, label: value);
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(width: 30),

            //TODO: Search Bar
            SizedBox(
              height: 50,
              width: 400,

              child: SearchBar(
                // shape: ,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                hintText: "Search Leads",
                textStyle: const MaterialStatePropertyAll<TextStyle>(
                  TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              
                leading: const Icon(Icons.search),
                backgroundColor: MaterialStatePropertyAll(Colors.green[400]),
                elevation: const MaterialStatePropertyAll(5),autoFocus: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
