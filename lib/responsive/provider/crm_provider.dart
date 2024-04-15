import 'dart:developer';

import 'package:almanet/constants/dummy_data/industries_dummy_data.dart';
import 'package:almanet/responsive/models/lead_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CRMProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

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

  void saveDataToFirebase({
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

  Future<List<LeadsModel>?> getLeadsData() async {
    try {
      isLoading = true;
      final response = await FirebaseFirestore.instance.collection('leads').get();
      log(response.toString());
      return [];
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
