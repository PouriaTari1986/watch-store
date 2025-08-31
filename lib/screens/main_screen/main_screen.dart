// main_screen.dart
import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:di_state_managment/screens/cart/cart_screen.dart';
import 'package:di_state_managment/screens/main_screen/home/home_screen.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../profile/profile_screen.dart';
import '../../gen/assets.gen.dart';
import '../../resource/app_colors.dart';
import '../../resource/strings.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();
  static const home = 0;
  static const profile = 2;
  static const cart = 1;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home;

  final List<int> _routeHistory = [BtmNavScreenIndex.home];

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _basketKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final Map<int, GlobalKey<NavigatorState>> _navKeys = {
    0: _homeKey,
    1: _basketKey,
    2: _profileKey,
  };

  void _onBottomNavTap({required int index}) {
    setState(() {
      selectedIndex = index;
      _routeHistory.add(selectedIndex);
    });
  }

  Future<bool> _onWillPop() async {
    final currentNavigator = _navKeys[selectedIndex]!.currentState!;
    if (currentNavigator.canPop()) {
      currentNavigator.pop();
      return false;
    } else if (_routeHistory.length > 1) {
      setState(() {
        _routeHistory.removeLast();
        selectedIndex = _routeHistory.last;
      });
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
                        MaterialPageRoute(builder: (_) => HomeScreen()),
                  ),
                  Navigator(
                    key: _basketKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (_) => CartScreen(
                        onColse: () {
                          setState(() {
                            selectedIndex = 0; // برگرد به خانه
                          });
                        },
                        cartRepository: cartRepository,
                      ),
                    ),
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (_) => ProfileScreen()),
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
                    BtmNAvItems(
                      iconSvgPath: Assets.svg.user,
                      text: AppStrings.prIcon,
                      isActive: selectedIndex == BtmNavScreenIndex.profile,
                      onTap: () =>
                          _onBottomNavTap(index: BtmNavScreenIndex.profile),
                    ),

                    ValueListenableBuilder<int>(
                      valueListenable: cartRepository.cartCount,
                      builder: (context, value, _) {
                        return GestureDetector(
                          onTap: () =>
                              _onBottomNavTap(index: BtmNavScreenIndex.cart),
                          child: CartBadge(
                            count: value,
                          ), // فقط CartBadge، خودش آیکون داره
                        );
                      },
                    ),

                    BtmNAvItems(
                      iconSvgPath: Assets.svg.homeHashtag,
                      text: AppStrings.homeIcon,
                      isActive: selectedIndex == BtmNavScreenIndex.home,
                      onTap: () =>
                          _onBottomNavTap(index: BtmNavScreenIndex.home),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BtmNAvItems extends StatelessWidget {
  final String iconSvgPath;
  final String text;
  final bool isActive;
  final VoidCallback onTap;
  final int badgeCount;

  const BtmNAvItems({
    super.key,
    required this.iconSvgPath,
    required this.text,
    required this.isActive,
    required this.onTap,
    this.badgeCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(iconSvgPath,colorFilter: ColorFilter.mode(
                isActive ? Colors.black : Colors.grey , BlendMode.srcIn)
              ),
              if (badgeCount > 0)
                Positioned(
                  right: -6,
                  top: -6,
                  child: CartBadge(count: badgeCount),
                ),
            ],
          ),
          Text(
            text,
            style: TextStyle(color: isActive ?  Colors.black :  Colors.grey,
          ),
      )],
      ),
    );
  }
}
