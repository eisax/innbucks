import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innbucks/data/api/api_client.dart';
import 'package:innbucks/data/model/response/survey_model.dart';
import 'package:innbucks/data/repository/survey_repo.dart';

class SurveyController extends GetxController implements GetxService {
  SurveyRepo surveyRepo;
  final ApiClient apiClient;
  SurveyController({
    required this.apiClient,
    required this.surveyRepo,
  });

  bool _isLoading = false;
  bool get isLoading => _isLoading;


  List<Survey> _survey = [];
  List<Survey> get survey => _survey;

  Future<bool> inistializeSurvey(BuildContext context) async {
    _isLoading = true;
    _survey = [];
    update();

    Response? response = await surveyRepo.getSurveyList(apiClient: apiClient);

    if (response?.statusCode == 201) {
      final responseData = response?.body;

      if (responseData != null) {
        if (responseData['data'] != null && responseData['data'] is List) {
          _survey = (responseData['data'] as List)
              .map((model) => Survey.fromJson(model))
              .toList();
        }
      }
      print(jsonEncode(_survey));

      _isLoading = false;
      update();
      return true;
    } else {
      _isLoading = false;
      update();
      return false;
    }
  }

 


}
