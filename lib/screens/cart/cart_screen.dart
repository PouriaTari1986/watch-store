import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/data/models/cart_model.dart';
import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/screens/cart/bloc/cart_bloc.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:di_state_managment/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  final CartRepo cartRepository;
  final VoidCallback? onColse;
  const CartScreen({super.key, required this.cartRepository, this.onColse, });

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    cartBloc.add(LoadCartEvent());
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: cartRepository.cartCount,
                builder: (_, value, _) {
                  return CartBadge(count: value);
                },
              ),
              Row(
                children: [
                  Text(AppStrings.bestSelled),
                  Dimens.small.width,
                  SvgPicture.asset(Assets.svg.list),
                ],
              ),
              IconButton(
                onPressed: onColse??(){},
                icon: SvgPicture.asset(Assets.svg.close),  // رو این میزنم صفحه جدید باز میشه
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is CartLoaded) {
                    final cart = state.cart;
                    if ((cart.userCart ?? []).isEmpty) {
                      return const Center(child: Text("سبد خرید خالی است"));
                    }
                    return CartList( list: [], userCart: [],);
                  } else if (state is CartError) {
                    return Center(child: Text("خطا: ${state.message}"));
                  }
                  return const SizedBox();
                },
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
                child: SizedBox(
                  height: 55,
                  width: 155,
                  child: 
                     MainBottun(
                      text: AppStrings.edmaeShpping,
                      onPressed: () {},
                      style: AppButtonStyleRed.mainButtonStyle,
                    ),
                  
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CartList extends StatelessWidget {
List <CartModel> list;
List<UserCart> userCart;
  
   CartList({super.key, required this.list,required this.userCart});

  @override
  Widget build(BuildContext context) {


    return Expanded(
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          
          return ShopingCartItem(
            cartModel: list[index], 
            
            userCart: userCart[index],
        
          );
        },
      ),
    );
  }
}
