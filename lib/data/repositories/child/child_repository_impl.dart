import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:triangle/data/models/child/child_model.dart';
import 'package:triangle/data/repositories/child/child_repository.dart';
import 'package:triangle/utils/exceptions/app_exceptions.dart';
import 'package:triangle/utils/exceptions/format_exceptions.dart';

class ChildRepositoryImpl implements ChildRepository {
  final FirebaseFirestore _firestore;

  ChildRepositoryImpl({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<String> saveChild(ChildModel child) async {
    try {
      final docRef = await _firestore
          .collection("users")
          .doc(child.parentId)
          .collection("children")
          .add(child.toJson());
          
      return docRef.id;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw "An unexpected error occurred. Please try again.";
    }
  }

  @override
  Future<List<ChildModel>> getChildren(String userId) async {
    final querySnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('children')
        .get();

    return querySnapshot.docs
        .map((doc) => ChildModel.fromSnapshot(doc))
        .toList();
  }
}