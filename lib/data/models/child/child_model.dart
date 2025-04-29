import 'package:cloud_firestore/cloud_firestore.dart';

class ChildModel {
  final String? id;
  final String parentId; 
  final String name;
  final DateTime dateOfBirth;
  final double height;
  final double weight;
  String? profilePicture;

  ChildModel({
    this.id,
    required this.parentId,
    required this.name,
    required this.dateOfBirth,
    required this.height,
    required this.weight,
    this.profilePicture,
  });

  Map<String, dynamic> toJson() {
    return {
      'userId': parentId,
      'name': name,
      'dateOfBirth': dateOfBirth,
      'height': height,
      'weight': weight,
      'profilePicture': profilePicture,
    };
  }

  factory ChildModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ChildModel(
      id: document.id,
      parentId: data['userId'] ?? '',
      name: data['name'] ?? '',
      dateOfBirth: (data['dateOfBirth'] as Timestamp).toDate(),
      height: (data['height'] as num).toDouble(),
      weight: (data['weight'] as num).toDouble(),
      profilePicture: data['profilePicture'],
    );
  }
}