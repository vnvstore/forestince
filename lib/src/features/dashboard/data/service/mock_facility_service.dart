import 'dart:async';
import '../model/facility_model.dart';

class MockFacilityService {
  // 1. In-memory storage: This acts as our virtual database
  static final List<FacilityModel> _mockFacilities = [
    FacilityModel(id: '1', name: 'Old Oak Forest Trail', usagePercentage: 0.84),
    FacilityModel(id: '2', name: 'Zen Garden Deck', usagePercentage: 0.72),
    FacilityModel(id: '3', name: 'Silent Retreat Pods', usagePercentage: 0.61),
    FacilityModel(id: '4', name: 'Crystal Spring', usagePercentage: 0.48),
  ];

  // Getter to access data
  Future<List<FacilityModel>> fetchFacilities() async {
    await Future.delayed(const Duration(milliseconds: 800)); // Simulate network
    return _mockFacilities;
  }
}
