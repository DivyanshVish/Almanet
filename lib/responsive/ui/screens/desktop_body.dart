import 'dart:developer';
import 'package:almanet/constants/dummy_data/industries_dummy_data.dart';
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
  @override
  void initState() {
    super.initState();
    getLeadsData();
  }

  Future getLeadsData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore.instance.collection('leads').get();

      List<LeadsModel> data = response.docs.map(
        (leads) {
          LeadsModel data = LeadsModel.fromJson(
            leads.data(),
            leads.id.toString(),
          );

          return data;
        },
      ).toList();

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
                      const SizedBox(width: 8),
                      SizedBox(
                        height: 35,
                        child: ElevatedButton(
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
                                return const CRMPopupDialogWidget();
                              },
                            );
                            await getLeadsData();
                          },
                          child: const Text(
                            'Generate Leads',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                          height: 35,
                          width: 270,
                          child: SearchBar(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.symmetric(horizontal: 16.0),
                            ),
                            hintText: "Search Leads",
                            textStyle: MaterialStateProperty.all<TextStyle>(
                              const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                            leading: const Icon(Icons.search, color: Colors.white),
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                            autoFocus: false,
                          ))
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
                      onPressEdit: () async {
                        await showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return CRMPopupDialogWidget(
                              isUpdating: true,
                              existingLead: crmProvider.leadsList[index],
                            );
                          },
                        );
                        await getLeadsData();
                      },
                      lead: LeadsModel(
                        id: crmProvider.leadsList[index].id ?? "",
                        name: crmProvider.leadsList[index].name ?? "",
                        contact: crmProvider.leadsList[index].contact ?? "",
                        address: crmProvider.leadsList[index].address ?? "",
                        email: crmProvider.leadsList[index].email ?? "",
                        companyName: crmProvider.leadsList[index].companyName ?? "",
                        selectedCompanyGroup: crmProvider.leadsList[index].selectedCompanyGroup ?? dummyIndustriesData[0],
                        numberOfTeamMembers: crmProvider.leadsList[index].numberOfTeamMembers ?? "",
                      ),
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
