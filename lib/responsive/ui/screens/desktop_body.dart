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
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController selectedCompanyGroupController = TextEditingController();
  TextEditingController numberOfTeamMembersController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeadsData();
  }

  Future getLeadsData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore.instance.collection('leads').get();

      List<LeadsModel> data = response.docs
          .map(
            (leads) => LeadsModel.fromJson(
              leads.data(),
            ),
          )
          .toList();

      if (!mounted) return;
      context.read<CRMProvider>().leadsList = data;
    } catch (e) {
      log(e.toString());
    }
  }

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
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(6),
                      //     ),
                      //     backgroundColor: Colors.green,
                      //   ),
                      //   child: const Text('New'),
                      //   onPressed: () async {

                      //   },
                      // ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () async {
                          await showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return CRMPopupDialogWidget(
                                // selectedCompanyGroup: crmProvider.selectedCompanyGroup!,
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
                                    address: addressController.text.trim(),
                                    contact: contactController.text.trim(),
                                    companyName: companyController.text.trim(),
                                    selectedCompanyGroup: crmProvider.selectedCompanyGroup,
                                    numberOfTeamMembers: numberOfTeamMembersController.text.trim(),
                                  );
                                  await crmProvider.saveDataToFirebase(lead: lead);
                                  Get.back();
                                },
                                selectIndustriesOnChange: (newValue) {
                                  crmProvider.selectedCompanyGroup = newValue;
                                },
                              );
                            },
                          );
                          await getLeadsData();
                        },
                        child: Text('Generate Leads'),
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(
                height: 24,
              ),
              Consumer<CRMProvider>(
                builder: (context, crmProvider, child) {
                  return ListView.builder(
                    itemCount: crmProvider.leadsList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => CRMListTile(
                      nameController: crmProvider.leadsList[index].name ?? "-",
                      contactController: crmProvider.leadsList[index].contact ?? "-",
                      addressController: crmProvider.leadsList[index].address ?? "-",
                      emailController: crmProvider.leadsList[index].email ?? "-",
                      companyController: crmProvider.leadsList[index].companyName ?? "-",
                      selectedCompanyGroup: crmProvider.leadsList[index].selectedCompanyGroup ?? "-",
                      numberOfTeamMembersController: crmProvider.leadsList[index].numberOfTeamMembers ?? "-",
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
