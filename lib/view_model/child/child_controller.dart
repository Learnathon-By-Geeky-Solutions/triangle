import 'package:get/get.dart';
import 'package:triangle/data/models/child/child_model.dart';
import 'package:triangle/data/repositories/child/child_repository.dart';

class ChildController extends GetxController {
  ChildController({required ChildRepository repository}) 
    : _repository = repository;

  final ChildRepository _repository;
  final Rx<ChildModel> child = ChildModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchChildData();
  }

  Future<void> fetchChildData() async {
    try {
      final childData = await _repository.getChildData();
      child.value = childData;
    } catch (e) {
      child.value = ChildModel.empty();
      rethrow;
    }
  }
}