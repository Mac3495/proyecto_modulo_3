import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proyecto/data/services/feature_flags/feature_flag_service.dart';

class FeatureFlagServiceImp implements FeatureFlagService {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> isInMaintenance() async {
    final doc = await _firestore.collection('featureFlags').doc('AM4XfZi4DGIqtdg5DZE0').get();
    final data = doc.data();
    if (data == null) return false;
    return data['isInMaintenance'] == true;
  }
}
