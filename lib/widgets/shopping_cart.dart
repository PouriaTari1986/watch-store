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
  });

  CartModel cartModel;

  @override
  State<ShopingCartItem> createState() => _ShopingCartItemState();
}

class _ShopingCartItemState extends State<ShopingCartItem> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return SurfaceContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.cartModel.product,
                  style: LightAppTextStyle.prodactTitle.copyWith(fontSize: 12),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "${widget.cartModel.price.seperatedWithComa} تومان",
                  style: LightAppTextStyle.caption,
                ),
                Visibility(
                  visible: widget.cartModel.discount > 0,
                  child: Text(
                    "${widget.cartModel.discountPrice.seperatedWithComa} با تخفیف",
                    style: LightAppTextStyle.timerStyle,
                  ),
                ),
                const Divider(),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        cartBloc.add(DeleteFromCartEvent(widget.cartModel.productId));
                      },
                      icon: SvgPicture.asset(Assets.svg.recycleBin),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                widget.cartModel.countloading = true;
                              });
                              cartBloc.add(AddToCartEvent(widget.cartModel.productId));
                            },
                            icon: SvgPicture.asset(Assets.svg.plus),
                          ),
                          Text("${widget.cartModel.count} عدد"),
                          widget.cartModel.countloading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(strokeWidth: 2),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      widget.cartModel.countloading = true;
                                    });
                                    cartBloc.add(RemoveFromCartEvent(widget.cartModel.productId));
                                  },
                                  icon: SvgPicture.asset(Assets.svg.minus),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.cartModel.image,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
