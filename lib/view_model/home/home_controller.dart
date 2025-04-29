import 'package:get/get.dart';
import 'package:triangle/data/models/child/child_model.dart';
import 'package:triangle/utils/constants/app_colors.dart';
import 'package:triangle/utils/helpers/age_calculator.dart';
import 'package:triangle/view_model/child/child_controller.dart';

class HomeController extends GetxController {
  HomeController({required this.childController});

  final ChildController childController;
  final RxList<List<dynamic>> ageGrid = <List<dynamic>>[
    ["Years", AppColor.mayaBlue, "0"],
    ["Months", AppColor.hotPink, "0"],
    ["Weeks", AppColor.brownYellow, "0"],
    ["Days", AppColor.pinkFlamingo, "0"],
  ].obs;

  @override
  void onReady() {
    super.onReady();
    _setupChildListener();
    _initialLoad();
  }

  void _setupChildListener() {
    // React to child data changes
    ever<ChildModel>(childController.child, (child) {
      updateAgeGrid(child.dateOfBirth);
    });
  }

  void _initialLoad() async {
    // Fetch child data if not already loaded
    if (childController.child.value == ChildModel.empty()) {
      await childController.fetchChildData();
    }
  }

  void updateAgeGrid(DateTime dob) {
    final ageData = AgeCalculator.getAgeInAllFormats(dob);
    
    ageGrid.value = [
      ["Years", AppColor.mayaBlue, ageData['years'].toString()],
      ["Months", AppColor.hotPink, ageData['months'].toString()],
      ["Weeks", AppColor.brownYellow, ageData['weeks'].toString()],
      ["Days", AppColor.pinkFlamingo, ageData['days'].toString()],
    ];
  }
}