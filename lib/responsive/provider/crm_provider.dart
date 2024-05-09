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
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

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

  /* --------------------------------- Delete --------------------------------- */
  List<LeadsModel> _deletedLeadsList = [];
  List<LeadsModel> get deletedLeadsList => _deletedLeadsList;

  set deletedLeadsList(List<LeadsModel> value) {
    _deletedLeadsList = value;
    notifyListeners();
  }

  /* --------------------------------- Search --------------------------------- */
  List<LeadsModel> _searchedLeadsList = [];
  List<LeadsModel> get searchedLeadsList => _searchedLeadsList;

  set searchedLeadsList(List<LeadsModel> value) {
    _searchedLeadsList = value;
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

  Future updateDataToFirebase({required LeadsModel lead}) async {
    try {
      isLoading = true;
      log(lead.id.toString());
      await FirebaseFirestore.instance.collection('leads').doc(lead.id).update(lead.toJson());
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }

  Future deleteDataFromFirebase({required String id}) async {
    try {
      isLoading = true;
      await FirebaseFirestore.instance.collection('leads').doc(id).delete();
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }

  Future searchDataFromFirebase({required String searchValue}) async {
    try {
      isLoading = true;
      QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore.instance.collection('leads').where('name', isEqualTo: searchValue).get();

      List<LeadsModel> data = response.docs.map(
        (leads) {
          LeadsModel data = LeadsModel.fromJson(
            leads.data(),
            leads.id.toString(),
          );

          return data;
        },
      ).toList();

      searchedLeadsList = data;
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }
}
