import 'package:almanet/responsive/models/lead_model.dart';
import 'package:almanet/responsive/provider/crm_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:almanet/constants/dummy_data/industries_dummy_data.dart';
import 'package:provider/provider.dart';

class CRMPopupDialogWidget extends StatefulWidget {
  const CRMPopupDialogWidget({
    super.key,
    this.existingLead,
    this.isUpdating,
  });

  final LeadsModel? existingLead;
  final bool? isUpdating;

  @override
  State<CRMPopupDialogWidget> createState() => _CRMPopupDialogWidgetState();
}

class _CRMPopupDialogWidgetState extends State<CRMPopupDialogWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController selectedCompanyGroupController = TextEditingController();
  TextEditingController numberOfTeamMembersController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.existingLead != null) {
      nameController.text = widget.existingLead!.name ?? "";
      addressController.text = widget.existingLead!.address ?? "";
      contactController.text = widget.existingLead!.contact ?? "";
      companyController.text = widget.existingLead!.companyName ?? "";
      emailController.text = widget.existingLead!.email ?? "";
      selectedCompanyGroupController.text = widget.existingLead!.selectedCompanyGroup ?? dummyIndustriesData[0];
      numberOfTeamMembersController.text = widget.existingLead!.numberOfTeamMembers ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AlertDialog(
          contentPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                      splashRadius: 20,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: Colors.black12,
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  'How many leads would you like?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(width: 1, color: Colors.black54),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    hint: const Text('Select the Industries'),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    value: context.watch<CRMProvider>().selectedCompanyGroup,
                    items: dummyIndustriesData.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      context.read<CRMProvider>().selectedCompanyGroup = newValue;
                    },
                  ),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Number of leads',
                    border: OutlineInputBorder(),
                  ),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  controller: numberOfTeamMembersController,
                ),
                const SizedBox(height: 18),
                Column(
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
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: contactController,
                      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Contact'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: addressController,
                      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Address'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Email Address'),
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
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (nameController.text.isEmpty && emailController.text.isEmpty && contactController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Please fill all the data"),
                                ),
                              );
                              return;
                            }
                            LeadsModel lead;
                            if (widget.isUpdating ?? false) {
                              lead = LeadsModel(
                                id: widget.existingLead!.id,
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                address: addressController.text.trim(),
                                contact: contactController.text.trim(),
                                companyName: companyController.text.trim(),
                                selectedCompanyGroup: context.read<CRMProvider>().selectedCompanyGroup,
                                numberOfTeamMembers: numberOfTeamMembersController.text.trim(),
                              );
                            } else {
                              lead = LeadsModel(
                                name: nameController.text.trim(),
                                email: emailController.text.trim(),
                                address: addressController.text.trim(),
                                contact: contactController.text.trim(),
                                companyName: companyController.text.trim(),
                                selectedCompanyGroup: context.read<CRMProvider>().selectedCompanyGroup,
                                numberOfTeamMembers: numberOfTeamMembersController.text.trim(),
                              );
                            }
                            (widget.isUpdating ?? false) ? await context.read<CRMProvider>().updateDataToFirebase(lead: lead) : await context.read<CRMProvider>().saveDataToFirebase(lead: lead);
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            backgroundColor: Colors.green,
                          ),
                          child: (widget.isUpdating ?? false) ? const Text('Update Leads') : const Text('Genertate Leads')),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        child: const Text('Close'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        (context.watch<CRMProvider>().isLoading)
            ? Container(
                color: Colors.black.withOpacity(0.2),
                height: double.infinity,
                width: double.infinity,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
