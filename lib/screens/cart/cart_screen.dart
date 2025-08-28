
import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
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
import 'package:url_launcher/url_launcher.dart';

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
                onPressed: onColse??()=>Navigator.pop(context),
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
                    final cart = state.userCart;
                    if ((cart ).cartList.isEmpty) {
                      return const Center(child: Text("سبد خرید خالی است"));
                    }
                    return CartList(cart);
                  } else if (state is CartError) {
                    return Center(child: Text("خطا: ${state.message}"));
                  }
                  return const SizedBox();
                },
              ),
            ),
    
            BlocConsumer<CartBloc,CartState>(
              listener: (BuildContext context, Object? state) async {  
              if (state is RecievedPayLinkState) {
                final Uri url = Uri.parse(state.url);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url,mode: LaunchMode.externalApplication);
                }else{
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("لینک پرداخت باز نشد")));
                }
              }
            },
                builder: (context, state){
                UserCart? userCart;
                if(state is CartLoaded)userCart = state.userCart;
                return Visibility(
                  visible: (userCart?.cartTotalPrice??0)>0,
                  child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<CartBloc>(context).add(PayCartEvent());
                    },
                    child: Container(
                      padding: EdgeInsets.all(Dimens.medium),
                      margin: EdgeInsets.all(Dimens.medium),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(Dimens.medium))
                      ),
                      child: Row(
                        children: [
                          Text("قیمت  ${userCart?.cartTotalPrice.seperatedWithComa} تومان",
                          style: LightAppTextStyle.caption,),
                          Visibility(
                            visible: userCart?.cartTotalPrice!= userCart?.totalWithoutDiscountPrice,
                            child: Text("قیمت  ${userCart?.totalWithoutDiscountPrice.seperatedWithComa} تومان",
                            style: LightAppTextStyle.caption.copyWith(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
              }
            
            
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.medium),
                child: SizedBox(
                  width: 55,
                  height: 155,
                  child: MainBottun(
                    text: AppStrings.edmaeShpping, 
                    onPressed: ()=>context.read<CartBloc>().add(PayCartEvent()),
                    style: AppButtonStyleRed.mainButtonStyle),
                ),),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CartList extends StatelessWidget {

  final UserCart cart;
   const CartList (this.cart, {super.key});

  @override
  Widget build(BuildContext context) {


    return ListView.builder(
      itemCount: cart.cartList.length,
      itemBuilder: (context, index) {
        
        return ShopingCartItem(cartModel: cart.cartList[index],
          
      
        );
      },
    );
  }
}
