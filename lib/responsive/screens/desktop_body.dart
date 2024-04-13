import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:almanet/responsive/screens/widgets/crm_list_tile.dart';
import 'package:almanet/responsive/screens/widgets/crm_popup_dialog.dart';

class DesktopBody extends StatefulWidget {
  const DesktopBody({super.key});

  @override
  State<DesktopBody> createState() => _DesktopBodyState();
}

class _DesktopBodyState extends State<DesktopBody> {
  String selectedCompanyGroup = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController selectedCompanyGroupController = TextEditingController();
  TextEditingController numberOfTeamMembersController = TextEditingController();

  void saveDataToFirebase() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String selectedCompany = selectedCompanyGroup;
    String address = addressController.text.trim();
    String contact = contactController.text.trim();
    String companyName = companyController.text.trim();
    String numberOfTeamMembers = numberOfTeamMembersController.text.trim();

    if (name.isNotEmpty && address.isNotEmpty && contact.isNotEmpty) {
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
      log("Please fill all fields!");
    }
  }

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
                    child: Text("Sales"),
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
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('New'),
                    onPressed: () {
                      //TODO: Add functionality for the "New" button here
                    },
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      backgroundColor: Colors.green,
                    ),
                    child: const Text('Generate Lead'),
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CRMPopupDialogWidget(
                            nameController: nameController,
                            addressController: addressController,
                            contactController: contactController,
                            companyController: companyController,
                            emailController: emailController,
                            selectedCompanyGroupController: selectedCompanyGroupController,
                            numberOfTeamMembersController: numberOfTeamMembersController,
                            onGenerateLeadsButton: () {
                              saveDataToFirebase();
                            },
                            selectIndustriesOnChange: (newValue) {
                              setState(() {
                                selectedCompanyGroup = newValue ?? "";
                              });
                            },
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              ListView.builder(
                itemCount: 1,
                shrinkWrap: true,
                itemBuilder: (context, index) => CRMListTile(
                  nameController: nameController,
                  contactController: contactController,
                  addressController: addressController,
                  emailController: emailController,
                  companyController: companyController,
                  selectedCompanyGroup: selectedCompanyGroup,
                  numberOfTeamMembersController: numberOfTeamMembersController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
