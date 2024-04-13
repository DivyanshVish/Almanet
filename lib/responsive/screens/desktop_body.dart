// ignore_for_file: unused_element

import 'package:almanet/constants/dummy_data/industries_dummy_data.dart';
import 'package:almanet/constants/hover_buttoons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DesktopBodyState createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  String? selectedCompanyGroup;
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController selectedCompanyGroupController = TextEditingController();
  TextEditingController numberOfTeamMembersController = TextEditingController();

  void saveDataToFirebase() async {
    String name = nameController.text.trim();
    String address = addressController.text.trim();
    String contact = contactController.text.trim();
    String companyName = companyController.text.trim();
    String email = emailController.text.trim();
    String selectedCompany = selectedCompanyGroup ?? selectedCompanyGroupController.text.trim();
    String numberOfTeamMembers = numberOfTeamMembersController.text.trim();

    if (name.isNotEmpty && address.isNotEmpty && contact.isNotEmpty) {
      // Access Firestore instance
      try {
        final response = await FirebaseFirestore.instance.collection('leads').add({
          'name': name,
          'address': address,
          'contact': contact,
          'companyName': companyName,
          'email': email,
          'selectedCompanyGroup': selectedCompany,
          'numberOfTeamMembers': numberOfTeamMembers,
        });

        log("[Data Added] $response");
      } catch (e) {
        log(e.toString());
      }
      // FirebaseFirestore.instance.collection('leads').add({
      //   'name': name,
      //   'address': address,
      //   'contact': contact,
      //   'companyName': companyName,
      //   'email': email,
      //   'selectedCompanyGroup': selectedCompanyGroup,
      //   'numberOfTeamMembers': numberOfTeamMembers,
      // }).then((value) {
      //   // Success message
      //   print("Data added successfully!");
      // }).catchError((error) {
      //   // Error message
      //   print("Failed to add data: $error");
      // });
    } else {
      // Validation error
      print("Please fill all fields!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 20),
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
                width: 0,
                defaultcolor: Colors.grey.shade600,
                fontsize: 23,
                hovercolor: Colors.green,
                ontap: () {},
                text: 'Sales',
              ),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                width: 0,
                defaultcolor: Colors.grey.shade600,
                fontsize: 23,
                hovercolor: Colors.green,
                ontap: () {},
                text: 'Reports',
              ),
            ),
            const SizedBox(width: 5),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: Hover_Button(
                width: 0,
                defaultcolor: Colors.grey.shade600,
                fontsize: 23,
                hovercolor: Colors.green,
                ontap: () {},
                text: 'Configuration',
              ),
            ),
            const SizedBox(width: 5),
            InkWell(
              hoverColor: Colors.transparent,
              onTap: () {},
              child: const Padding(
                padding: EdgeInsetsDirectional.only(end: 20),
                child: Icon(Icons.settings),
              ),
            )
          ],
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.dehaze_rounded,
              size: 35,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      // Add functionality for the "New" button here
                    },
                    child: const Text(
                      'New',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            content: SingleChildScrollView(
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.29,
                                    height: MediaQuery.of(context).size.height * 0.9,
                                    child: AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const Text(
                                                  'Need help to reach the target?',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
                                                    Icons.close,
                                                    color: Colors.black,
                                                    size: 30,
                                                  ),
                                                  onPressed: () {
                                                    Get.back();
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            height: 10,
                                            thickness: 1,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              'How many leads would you like?',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15),
                                            child: DropdownButton<String>(
                                              hint: const Text('Select the Industries'),
                                              value: selectedCompanyGroup,
                                              items: dummyIndustriesData.map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedCompanyGroup = newValue;
                                                });
                                              },
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15, right: 15),
                                            child: TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Number of leads',
                                                border: OutlineInputBorder(),
                                              ),
                                              style: const TextStyle(
                                                fontSize: 14, // Adjust font size here
                                              ),
                                              controller: numberOfTeamMembersController,
                                            ),
                                          ),
                                          const SizedBox(height: 18),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Lead Information',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                TextFormField(
                                                  controller: nameController,
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Name',
                                                  ),
                                                  onChanged: (value) {
                                                    nameController = value as TextEditingController;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextFormField(
                                                  controller: contactController,
                                                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Contact'),
                                                  onChanged: (value) {
                                                    contactController = value as TextEditingController;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextFormField(
                                                  controller: addressController,
                                                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Address'),
                                                  onChanged: (value) {
                                                    addressController = value as TextEditingController;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextFormField(
                                                  controller: emailController,
                                                  decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email Address'),
                                                  onChanged: (value) {
                                                    emailController = value as TextEditingController;
                                                  },
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                TextFormField(
                                                  controller: companyController,
                                                  decoration: const InputDecoration(
                                                    border: OutlineInputBorder(),
                                                    labelText: 'Company Name',
                                                  ),
                                                  onChanged: (value) {
                                                    companyController = value as TextEditingController;
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  saveDataToFirebase();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  backgroundColor: Colors.green,
                                                ),
                                                child: const Text(
                                                  'Generate Leads',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  //Navigator.of(context).pop();
                                                  Get.back();
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                  ),
                                                  backgroundColor: Colors.green,
                                                ),
                                                child: const Text(
                                                  'Close',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Generate Lead',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name : ${nameController.text}',
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Contact : ${contactController.text}',
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Address : ${addressController.text}',
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Email : ${emailController.text}',
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Company Name : ${companyController.text}',
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Selected Industries : $selectedCompanyGroup',
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Number of Leads : ${numberOfTeamMembersController.text}',
                      style: const TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
