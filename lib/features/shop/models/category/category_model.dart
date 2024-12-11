import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String name;
  String image;
  final String id;
  final String parentId;
  final bool isFeatured;

  CategoryModel({
    required this.name,
    required this.image,
    required this.id,
    this.parentId = '',
    required this.isFeatured,
  });

  Map<String, dynamic> toJson() => {
        'Name': name,
        'Image': image,
        'ParentId': '',
        'IsFeatured': isFeatured,
        'Id': id,
      };

  static CategoryModel empty() => CategoryModel(
        name: '',
        image: '',
        id: '',
        isFeatured: false,
      );
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    if (snapshot.data() != null) {
      final data = snapshot.data()!;
      return CategoryModel(
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        id: data['Id'] ?? '',
        parentId: data['ParentId'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
