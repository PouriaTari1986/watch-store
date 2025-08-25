
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key,this.count});
final int? count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(height: 32,width: 36,),
        SvgPicture.asset(Assets.svg.shoppingBascket,colorFilter: ColorFilter.mode(Colors.black,BlendMode.srcIn),),
        //badges
        if(count!= null && count !> 0)
        Positioned(
          top: -4,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: LightAppColors.discountColor,
              
            ),
            child: Text(count.toString(),style: TextStyle(color: Colors.white),),
          ),
        )
      ],
    );
  }
}