import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:di_state_managment/widgets/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(child:
        
        Align(
          alignment: Alignment.centerLeft,
          child: Text(AppStrings.shopBs,style: LightAppTextStyle.title,)),),

          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:Dimens.medium),
                padding: EdgeInsets.all(Dimens.medium),
                height: size.height*.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LightAppColors.scaffoldColor,
                  boxShadow: [
                    BoxShadow(
                      color: LightAppColors.shadowColor,
                      offset: Offset(0, 3),
                      blurRadius: 3
                    )
                  ]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){},
                     icon: SvgPicture.asset(Assets.svg.vector)),
          
                     Expanded(
                       child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                         children: [
                           Text(AppStrings.sendToAdd,style: LightAppTextStyle.caption,),
                          Dimens.small.height,
                          FittedBox(
                            child: Text(AppStrings.lurem,style: LightAppTextStyle.title,
                            ),
                          ),
                          
                         ],
                       ),
                     )
                  ],
                ),
              ),
              Expanded(child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  
                  return ShopingCartItem(
                    productTitle: AppStrings.productExName
                  , productPrices: 700000 
                  , productPricesWithDiscount: 630000
                  );
                },
                )
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left:Dimens.medium,right: Dimens.medium,bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        0.2.width,
                        Text("مجموع  ${630000.seperatedWithComa}  تومان  ",style: LightAppTextStyle.title,),
                    
                        SizedBox(
                          height: 55,
                          width: 155,
                          child: MainBottun(text:AppStrings.edmaeShpping, onPressed:() {}, style: AppButtonStyleRed.mainButtonStyle,))
                      ],
                    ),
                  ),
                )
            ],
          ),
      ));
  }
}

// ignore: must_be_immutable, use_key_in_widget_constructors
