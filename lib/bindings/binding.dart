import 'package:get/get.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class GeneralBading extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
