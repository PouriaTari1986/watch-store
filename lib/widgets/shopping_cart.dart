import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/widgets/surface_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

// ignore: must_be_immutable
class ShopingCartItem extends StatelessWidget {
  const ShopingCartItem({
    super.key,
    required this.count,
    required this.productTitle,
    required this.cartTotalPrice,
    required this.productPtotalWithoutDiscountPricericesWithDiscount, 
    this.add, 
    this.remove, 
    this.delete,
  });
  final VoidCallback? add;
  final VoidCallback? remove;
  final VoidCallback? delete;

  final int count ;
  final String productTitle;
  final int cartTotalPrice;
  final int productPtotalWithoutDiscountPricericesWithDiscount;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  productTitle,
                  style: LightAppTextStyle.prodactTitle.copyWith(fontSize: 12),
                ),
                Text(
                  "${productPtotalWithoutDiscountPricericesWithDiscount.seperatedWithComa}  تومان",
                  style: LightAppTextStyle.caption,
                ),
                Text(
                  "${cartTotalPrice.seperatedWithComa}  با تخفیف",
                  style: LightAppTextStyle.timerStyle,
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: delete,
                      icon: SvgPicture.asset(Assets.svg.recycleBin),
                    ),

                    Expanded(child: SizedBox()),

                    IconButton(
                      onPressed: add,
                      icon: SvgPicture.asset(Assets.svg.plus),
                    ),

                    Text("عدد$count"),
                    IconButton(
                      onPressed: remove,
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
