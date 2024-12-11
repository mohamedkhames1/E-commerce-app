import 'package:get/get.dart';
import 'package:t_store/features/authentication/screens/auth/login/forget_password.dart';
import 'package:t_store/features/authentication/screens/auth/login/login.dart';
import 'package:t_store/features/authentication/screens/auth/signup/signup_screen.dart';
import 'package:t_store/features/authentication/screens/auth/signup/verify_email.dart';
import 'package:t_store/features/authentication/screens/onbording/onbording_screan.dart';
import 'package:t_store/features/personalization/screens/address/user_address_screen.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/features/personalization/screens/settings/setting.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/features/shop/screens/home/home_page.dart';
import 'package:t_store/features/shop/screens/product_review/product_review_screen.dart';
import 'package:t_store/features/shop/screens/store/store.dart';
import '../features/shop/screens/cart/cart_screen.dart';
import '../features/shop/screens/order/order.dart';
import '../features/shop/screens/wishlist/wishlist.dart';
import 'routs.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomePage()),
    GetPage(name: TRoutes.store, page: () => const StorePage()),
    GetPage(name: TRoutes.favourites, page: () => const WishListScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
    GetPage(
        name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const Checkout()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const Profile()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreens()),
    GetPage(name: TRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmail()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnbordingScreen()),
// Add more GetPage entries as needed
  ];
}
