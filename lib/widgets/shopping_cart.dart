import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/data/models/cart_model.dart';
import 'package:di_state_managment/screens/cart/bloc/cart_bloc.dart';
import 'package:di_state_managment/widgets/surface_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

// ignore: must_be_immutable
class ShopingCartItem extends StatefulWidget {
   ShopingCartItem({
    super.key,
  required this.cartModel,
  required this.userCart
  });
  CartModel cartModel;
  UserCart userCart;

  @override
  State<ShopingCartItem> createState() => _ShopingCartItemState();
}

class _ShopingCartItemState extends State<ShopingCartItem> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return SurfaceContainer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.userCart.product!,
                  style: LightAppTextStyle.prodactTitle.copyWith(fontSize: 12),
                ),
                Text(
                  "${widget.cartModel.totalWithoutDiscountPrice!.seperatedWithComa}  تومان",
                  style: LightAppTextStyle.caption,
                ),
                Text(
                  "${widget.cartModel.cartTotalPrice!.seperatedWithComa}  با تخفیف",
                  style: LightAppTextStyle.timerStyle,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: (){
                        cartBloc.add(DeleteFromCartEvent(widget.userCart.productId!));
                      },
                      icon: SvgPicture.asset(Assets.svg.recycleBin),
                    ),

                    Expanded(child: SizedBox()),

                    IconButton(
                      onPressed: (){
                        setState(() {
                          widget.cartModel.countloading = true;
                        });
                        cartBloc.add(AddToCartEvent(widget.userCart.productId!));
                      },
                      icon: SvgPicture.asset(Assets.svg.plus),
                    ),

                    widget.cartModel.countloading?
                    SizedBox(height: 24,width: 24,child: CircularProgressIndicator() ,):
                    Text("عدد${widget.userCart.count}"),
                    IconButton(
                      onPressed: (){
                         setState(() {
                          widget.cartModel.countloading = true;
                        });
                        cartBloc.add(RemoveFromCartEvent(widget.userCart.productId!));
                      },
                      icon: SvgPicture.asset(Assets.svg.minus),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Image.asset(Assets.png.product.path, height: 130),
        ],
      ),
    );
  }
}
