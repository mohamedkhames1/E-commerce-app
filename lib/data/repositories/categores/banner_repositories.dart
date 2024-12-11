import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner/banner_model.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
  final db = FirebaseFirestore.instance;
  Future<List<BannerModel>> getBanners() async {
    try {
      final result =
          await db.collection('Banners').where('active', isEqualTo: true).get();
      return result.docs
          .map((banner) => BannerModel.fromSnapshot(banner))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'some thing is wrong , please try again';
    }
  }
}
