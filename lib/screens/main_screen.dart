import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/screens/cart/cart_screen.dart';
import 'package:di_state_managment/screens/home/home_screen.dart';
import 'package:di_state_managment/screens/profile_screen.dart';
import 'package:di_state_managment/widgets/button_navigation_item.dart';
import 'package:flutter/material.dart';

class ButtonNavigationScreensIndex {
  ButtonNavigationScreensIndex._();
  static const home = 0;
  static const basket = 1;
  static const profile = 2;
}

// ignore: must_be_immutable
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<int> _routeHistory = [ButtonNavigationScreensIndex.home];

  int selectedIndex = ButtonNavigationScreensIndex.home;

  final GlobalKey<NavigatorState> _homeKey = GlobalKey();

  final GlobalKey<NavigatorState> _basketKey = GlobalKey();

  final GlobalKey<NavigatorState> _profileKey = GlobalKey();

  late final Map map = {
    ButtonNavigationScreensIndex.home: _homeKey,
    ButtonNavigationScreensIndex.basket: _basketKey,
    ButtonNavigationScreensIndex.profile: _profileKey,
  };

  Future<bool> _onPopIvoked() async {
    if (map[selectedIndex].currentState!.canPop()) {
      map[selectedIndex].currentState!.pop();
    } else if (_routeHistory.length > 1) {
      setState(() {
        _routeHistory.removeLast();
        selectedIndex = _routeHistory.last;
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double btNavHeight = size.height * 0.1;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => _onPopIvoked(),
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
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                  ),
                  Navigator(
                    key: _basketKey,
                    onGenerateRoute: (settings) =>
                        MaterialPageRoute(builder: (context) => CartScreen(cartRepository: cartRepository)),
                  ),
                  Navigator(
                    key: _profileKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
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
                      isActive:
                          selectedIndex == ButtonNavigationScreensIndex.profile,
                      onTap: () => btmNAvigationOnPressed(
                        index: ButtonNavigationScreensIndex.profile,
                      ),
                    ),

                    BtmNAvItems(
                      count: 1,
                      iconSvgPath: Assets.svg.shoppingBascket,
                      text: AppStrings.shopBs,
                      isActive:
                          selectedIndex == ButtonNavigationScreensIndex.basket,
                      onTap: () => btmNAvigationOnPressed(
                        index: ButtonNavigationScreensIndex.basket,
                      ),
                    ),

                    BtmNAvItems(
                      iconSvgPath: Assets.svg.homeHashtag,
                      text: AppStrings.homeIcon,
                      isActive:
                          selectedIndex == ButtonNavigationScreensIndex.home,
                      onTap: () => btmNAvigationOnPressed(
                        index: ButtonNavigationScreensIndex.home,
                      ),
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

  void btmNAvigationOnPressed({required int index}) {
    setState(() {
      selectedIndex = index;
      _routeHistory.add(selectedIndex);
    });
  }
}
