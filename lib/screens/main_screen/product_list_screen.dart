
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
            CartBadge(count: 1,),
            Row(
              children: [Text(AppStrings.bestSelled),
              Dimens.small.width,
              SvgPicture.asset(Assets.svg.list)
              ],
            
            ),
            IconButton(onPressed: (){}, 
            icon: SvgPicture.asset(Assets.svg.close))
          ],
        )
        )
      ),
    );
  }
}
class CustomAppBar extends StatelessWidget implements PreferredSize{
 

  const CustomAppBar({super.key,required this.child});
@override
final Widget child;
  @override
  Widget build(BuildContext context) {
    return PreferredSize(preferredSize: preferredSize, child: Container(
      height: preferredSize.height,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(Dimens.medium),
        bottomRight: Radius.circular(Dimens.medium),
        ),
        color: LightAppColors.appBar,
        boxShadow: [
          BoxShadow(
            
            color: LightAppColors.shadowColor,
            offset: Offset(0, 2),
            blurRadius: 3
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.medium),
        child: child,
      ),
    ));
  }
  

  
  @override
  
  Size get preferredSize => const Size.fromHeight(50);

}


class CartBadge extends StatelessWidget {
  const CartBadge({super.key,this.count});
final count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 32,width: 32,),
        SvgPicture.asset(Assets.svg.shoppingBascket,colorFilter: ColorFilter.mode(Colors.black,BlendMode.srcIn),),
        Visibility(
          visible: count>0?true:false,
          child: Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: LightAppColors.discountColor,
                
              ),
              child: Text(count.toString(),style: TextStyle(color: Colors.white),),
            ),
          ))
      ],
    );
  }
}