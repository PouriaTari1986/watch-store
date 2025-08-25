import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/widgets/surface_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../gen/assets.gen.dart';

// ignore: must_be_immutable
class ShopingCartItem extends StatelessWidget {
   ShopingCartItem({
    
    super.key,
   required this.productTitle, 
   required this.productPrices, 
   required this.productPricesWithDiscount
    
    });

int count =0;
final String productTitle;
final int productPrices;
final int productPricesWithDiscount;
  @override
  Widget build(BuildContext context) {
    return SurfaceContainer(child:
    
    Row(
      children: [
        Expanded(
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(productTitle,style: LightAppTextStyle.prodactTitle.copyWith(fontSize: 12),),
              Text("${productPrices.seperatedWithComa }  تومان",style: LightAppTextStyle.caption,),
              Text("${productPricesWithDiscount.seperatedWithComa}  با تخفیف"  ,style: LightAppTextStyle.timerStyle,),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  IconButton(onPressed: (){}, icon: SvgPicture.asset(Assets.svg.recycleBin)),

                  Expanded(child: SizedBox()),

                  IconButton(onPressed: (){}, icon: SvgPicture.asset(Assets.svg.plus)),
                  
                  Text("عدد$count"),
                  IconButton(onPressed: (){}, icon: SvgPicture.asset(Assets.svg.minus)),
                  

                ],)
          
            ],
          ),
        ),
        Image.asset(Assets.png.product.path,height: 130,),
        
      ],
    )

     );
  }
}