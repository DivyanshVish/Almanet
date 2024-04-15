import 'dart:developer';
import 'package:almanet/responsive/models/lead_model.dart';
import 'package:almanet/responsive/provider/crm_provider.dart';
import 'package:almanet/responsive/ui/widgets/crm_list_tile.dart';
import 'package:almanet/responsive/ui/widgets/crm_popup_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    log("Rebuild");
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
              Consumer<CRMProvider>(
                builder: (context, crmProvider, child) {
                  return Row(
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
                        onPressed: () async {
                          //TODO: Add functionality for the "New" button here
                          await crmProvider.getLeadsData();
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
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return CRMPopupDialogWidget(
                                selectedCompanyGroup: crmProvider.selectedCompanyGroup!,
                                nameController: nameController,
                                addressController: addressController,
                                contactController: contactController,
                                companyController: companyController,
                                emailController: emailController,
                                selectedCompanyGroupController: selectedCompanyGroupController,
                                numberOfTeamMembersController: numberOfTeamMembersController,
                                onGenerateLeadsButton: () async {
                                  if (nameController.text.isEmpty && emailController.text.isEmpty && contactController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Please fill all the data"),
                                      ),
                                    );
                                    return;
                                  }
                                  LeadsModel lead = LeadsModel(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    selectedCompanyGroup: selectedCompanyGroup,
                                    address: addressController.text.trim(),
                                    contact: contactController.text.trim(),
                                    companyName: companyController.text.trim(),
                                    numberOfTeamMembers: numberOfTeamMembersController.text.trim(),
                                  );
                                  crmProvider.saveDataToFirebase(lead: lead);
                                },
                                selectIndustriesOnChange: (newValue) {
                                  crmProvider.selectedCompanyGroup = newValue;
                                },
                              );
                            },
                          );
                        },
                      ),
                    ],
                  );
                },
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
