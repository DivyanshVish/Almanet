import 'dart:developer';

import 'package:almanet/constants/dummy_data/industries_dummy_data.dart';
import 'package:almanet/responsive/models/lead_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRMProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<LeadsModel> _leadsList = [];
  List<LeadsModel> get leadsList => _leadsList;

/* --------------------------------- Update --------------------------------- */
  List<LeadsModel> _updatedLeadsList = [];
  List<LeadsModel> get updatedLeadsList => _updatedLeadsList;

/* --------------------------------- Update --------------------------------- */
  set updatedLeadsList(List<LeadsModel> value) {
    _updatedLeadsList = value;
    notifyListeners();
  }

  set leadsList(List<LeadsModel> value) {
    _leadsList = value;
    notifyListeners();
  }

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String? _selectedCompanyGroup = dummyIndustriesData[0];
  String? get selectedCompanyGroup => _selectedCompanyGroup;

  set selectedCompanyGroup(String? value) {
    _selectedCompanyGroup = value;
    notifyListeners();
  }

  Future saveDataToFirebase({
    required LeadsModel lead,
  }) async {
    try {
      isLoading = true;

      final response = await FirebaseFirestore.instance.collection('leads').add(lead.toJson());

      log("[Data Added] $response");
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
