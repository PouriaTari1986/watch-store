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
  const CartScreen({super.key, required this.cartRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
         final bloc = CartBloc(cartRepository);
          bloc.add( LoadCartEvent()); // ابتدا Bloc ساخته شد، بعد Event اضافه شد
          return bloc; // Bloc را بازگردانید
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder<int>(
                  valueListenable: cartRepository.cartCount,
                  builder: (context, value, child) {
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
                  onPressed: () => Navigator.pop(context),
                  icon: SvgPicture.asset(Assets.svg.close),
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
                      return CartList(cart: cart);
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
                    child: MainBottun(
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
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final CartModel cart;
  const CartList({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    final items = cart.userCart ?? [];
    final cartBloc = BlocProvider.of<CartBloc>(context);

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ShopingCartItem(
          productTitle: item.product ?? "",
          productPtotalWithoutDiscountPricericesWithDiscount: cart.totalWithoutDiscountPrice ?? 0,
          cartTotalPrice: cart.cartTotalPrice ?? 0,
          count: item.count ?? 0,
          add: () => cartBloc.add(AddToCartEvent(item.productId ?? 0)),
          remove: () => cartBloc.add(RemoveFromCartEvent(item.productId ?? 0)),
          delete: () => cartBloc.add(DeleteFromCartEvent(item.productId ?? 0)),
        );
      },
    );
  }
}
