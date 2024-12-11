import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/category/category_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

import 't_fireStore_service.dart';

class CategoryRepositry extends GetxController {
  static CategoryRepositry get instance => Get.find();
  final db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getCategories() async {
    try {
      final snapShot = await db.collection('Categories').get();
      final list =
          snapShot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'some thing is wrong , please try again';
    }
  }

  Future<void> uploadDomyData(List<CategoryModel> categories) async {
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
// Loop through each category
      for (var category in categories) {
// Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);
        log('***************************************************************************');
        log(file.toString());
        log('***************************************************************************');
// Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Categories', file, category.name);
// Assign URL to Category. image attribute
        category.image = url;
// Store Category in Firestore
        await db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'some thing is wrong , please try again';
    }
  }
}
