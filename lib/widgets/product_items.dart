import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    
    super.key,
    
    this.discount = 0,
    this.timer = 0,
    this.oldPriceT = 0,
    required this.productName,
    required this.price
  });
final  productName;
final  price;
final  oldPriceT;
final  discount;
final  timer;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.small),
      margin: EdgeInsets.all(Dimens.medium),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Dimens.medium,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: LightAppColors.productPage,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.png.unnamed.path),
          Dimens.medium.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              productName,
              style: LightAppTextStyle.prodactTitle,
            ),
          ),
          Dimens.medium.height,
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${650000.seperatedWithComa}تومان"),
                  Visibility(
                    visible: discount>0?true:false,
                    child: Text(900000.seperatedWithComa,style: LightAppTextStyle.oldPrice,)),
                ],
              ),
              Visibility(
                visible: discount>0?true:false,
                child: Container(
                  padding: EdgeInsets.all(
                    Dimens.small * .5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: LightAppColors.discountColor,
                  ),
                  child: Text(
                    "20%",
                    style: LightAppTextStyle.discountText,
                  ),
                ),
              ),
              
            ],
          ),
         
                            
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Visibility(
              visible: timer>0?true:false,
              child: Container(
                height: 2,
                width: double.infinity,
                color: Colors.blue,
              ),
            ),
          ),
         
                            
          Visibility(
            visible: timer>0?true:false,
            child: Text("09:24:36",style: LightAppTextStyle.timerStyle,)),
        ],
      ),
      
    );
  }
}