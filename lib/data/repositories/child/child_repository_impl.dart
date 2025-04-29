import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:triangle/data/models/child/child_model.dart';
import 'package:triangle/data/repositories/child/child_repository.dart';
import 'package:triangle/data/repositories/user/user_repository.dart';
import 'package:triangle/utils/exceptions/app_exceptions.dart';
import 'package:triangle/utils/exceptions/format_exceptions.dart';

class ChildRepositoryImpl implements ChildRepository {
  final UserRepository _userRepository;
  final FirebaseFirestore _firestore;
  static const String commonErrorMessage = "An error occurred. Please try again later.";

  ChildRepositoryImpl({
    required UserRepository userRepository,
    FirebaseFirestore? firestore,
  }) : _userRepository = userRepository, 
       _firestore = firestore ?? FirebaseFirestore.instance;

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
      throw commonErrorMessage;
    }
  }

  
  @override
  Future<String> getChildId() async {
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(_userRepository.userId)
          .collection('children')
          .limit(1)
          .get();
      
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id;
      } else {
        return ChildModel.empty().id!;
      }
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw commonErrorMessage;
    }
  }

  @override
  Future<ChildModel> getChildData() async {
    
    try {
      final querySnapshot = await _firestore
          .collection('users')
          .doc(_userRepository.userId)
          .collection('children')
          .limit(1)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return ChildModel.fromSnapshot(querySnapshot.docs.first);
      } else {
        return ChildModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw commonErrorMessage;
    }
  }

  @override
  Future<void> updateChildData(ChildModel child) async {
    try {
      final docRef = _firestore
          .collection("users")
          .doc(child.parentId)
          .collection("children")
          .doc(child.id);

      await docRef.update(child.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code);
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code);
    } catch (e) {
      throw commonErrorMessage;
    }
  }
}