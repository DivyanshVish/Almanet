import 'package:almanet/responsive/provider/crm_provider.dart';
import 'package:almanet/responsive/ui/widgets/crm_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../models/lead_model.dart';

class CRMListTile extends StatelessWidget {
  CRMListTile({
    super.key,
    required this.nameController,
    required this.contactController,
    required this.addressController,
    required this.emailController,
    required this.companyController,
    required this.selectedCompanyGroup,
    required this.numberOfTeamMembersController,
  });

  final String nameController;
  final String contactController;
  final String addressController;
  final String emailController;
  final String companyController;
  final String selectedCompanyGroup;
  final String numberOfTeamMembersController;

  TextEditingController nameControllerUpdate = TextEditingController();
  TextEditingController addressControllerUpdate = TextEditingController();
  TextEditingController contactControllerUpdate = TextEditingController();
  TextEditingController companyControllerUpdate = TextEditingController();
  TextEditingController emailControllerUpdate = TextEditingController();
  TextEditingController selectedCompanyGroupController =
      TextEditingController();
  TextEditingController numberOfTeamMembersControllerUpdate =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Name : $nameController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Contact : $contactController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Address : $addressController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Email : $emailController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Company Name : $companyController',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: Text(
                  'Selected Industries : $selectedCompanyGroup',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Consumer<CRMProvider>(builder: (context, crmProvider, child) {
            return Row(
              children: [
                Expanded(
                  child: Text(
                    'Number of Leads : $numberOfTeamMembersController',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                Expanded(
                  child: EditButtonCrmPage(
                    nameController: nameControllerUpdate,
                    addressController: addressControllerUpdate,
                    contactController: contactControllerUpdate,
                    companyController: companyControllerUpdate,
                    emailController: emailControllerUpdate,
                    selectedCompanyGroupController:
                        selectedCompanyGroupController,
                    numberOfTeamMembersController:
                        numberOfTeamMembersControllerUpdate,
                    onGenerateLeadsButton: () async {
                      if (nameControllerUpdate.text.isEmpty &&
                          emailControllerUpdate.text.isEmpty &&
                          contactControllerUpdate.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please fill all the data"),
                          ),
                        );
                        return;
                      }
                      LeadsModel lead = LeadsModel(
                        name: nameControllerUpdate.text.trim(),
                        email: emailControllerUpdate.text.trim(),
                        address: addressControllerUpdate.text.trim(),
                        contact: contactControllerUpdate.text.trim(),
                        companyName: companyControllerUpdate.text.trim(),
                        selectedCompanyGroup: crmProvider.selectedCompanyGroup,
                        numberOfTeamMembers:
                            numberOfTeamMembersControllerUpdate.text.trim(),
                      );
                      await crmProvider.saveDataToFirebase(lead: lead);
                      Get.back();
                    },
                    selectIndustriesOnChange: (newValue) {
                      crmProvider.selectedCompanyGroup = newValue;
                    },
                  ),
                )
              ],
            );
          }),
        ],
      ),
    );
  }
}
