import 'package:triangle/data/models/child/child_model.dart';

abstract class ChildRepository {
  Future<String> saveChild(ChildModel child);
  Future<String> getChildId();
  Future<ChildModel> getChildData();
  Future<void> updateChildData(ChildModel child);
}