import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:t_store/features/personalization/screens/settings/setting.dart';
import 'package:t_store/features/shop/screens/home/home_page.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import 'package:t_store/features/shop/screens/wishlist/wishlist.dart';

class NavigationController extends GetxController {
  int selectedIndex = 0;
  void changeSelectedIndex(int index) {
    selectedIndex = index;
    update();
  }

  final screens = [
    const HomePage(),
    const StorePage(),
    const WishListScreen(),
    const SettingScreen(),
  ];
}
