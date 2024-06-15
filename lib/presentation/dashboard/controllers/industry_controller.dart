import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final fetchIndustries = FirebaseFirestore.instance.collection("industries").snapshots();
  var balance = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBalance();
  }

  void fetchBalance() async {
    try {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('balance')
          .doc('business_coins')
          .get();

      if (documentSnapshot.exists) {
        balance.value = documentSnapshot.get('balance');
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error fetching balance: $e');
    }
  }
}
