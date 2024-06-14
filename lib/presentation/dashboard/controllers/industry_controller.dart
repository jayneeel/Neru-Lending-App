import "package:cloud_firestore/cloud_firestore.dart";
import 'package:get/get.dart';

import '../model/industry_response_model.dart';

class IndustryController extends GetxController {
  var industryList = <Industry>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchIndustries();
    super.onInit();
  }

  void fetchIndustries() async {
    try {
      isLoading(true);
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('industries').get();
      var industries = snapshot.docs.map((doc) => Industry.fromJson(doc.data() as Map<String, dynamic>)).toList();
      print("***********");
      print(industries);
      industryList.assignAll(industries);
    } catch (e) {
      Get.snackbar('Error', e.toString(),);
    } finally {
      isLoading(false);
    }
  }
}
