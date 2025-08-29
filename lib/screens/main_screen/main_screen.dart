// main_screen.dart
import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:di_state_managment/screens/cart/cart_screen.dart';
import 'package:di_state_managment/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../profile/profile_screen.dart';
import '../../gen/assets.gen.dart';
import '../../resource/app_colors.dart';
import '../../resource/strings.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _basketKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final Map<int, GlobalKey<NavigatorState>> _navKeys = {
    0: _homeKey,
    1: _basketKey,
    2: _profileKey,
  };

  void _onBottomNavTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    final currentNavigator = _navKeys[selectedIndex]!.currentState!;
    if (currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    }
    return true; // اجازه می‌دهد اپ خارج شود
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double btNavHeight = size.height * 0.1;

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: btNavHeight,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                  ),
                  Navigator(
                    key: _basketKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (_) => CartScreen(
                        onColse: () {
                          setState(() {
                            selectedIndex = 0; // برگرد به خانه
                          });
                        }, cartRepository: cartRepository,
                      ),
                    ),
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: btNavHeight,
                color: LightAppColors.btNavColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildBottomNavItem(
                        iconPath: Assets.svg.user,
                        text: AppStrings.prIcon,
                        index: 2),
                    _buildBottomNavItem(
                        iconPath: Assets.svg.shoppingBascket,
                        text: AppStrings.shopBs,
                        index: 1),
                    _buildBottomNavItem(
                        iconPath: Assets.svg.homeHashtag,
                        text: AppStrings.homeIcon,
                        index: 0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(
      {required String iconPath, required String text, required int index}) {
    bool isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => _onBottomNavTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ignore: deprecated_member_use
          SvgPicture.asset(iconPath, color: isActive ? Colors.blue : Colors.grey),
          const SizedBox(height: 4),
          Text(
            text,
            style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
          ),
        ],
      ),
    );
  }
}
