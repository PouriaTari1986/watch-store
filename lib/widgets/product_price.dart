// import 'package:di_state_managment/componnet/extension.dart';
// import 'package:di_state_managment/componnet/text_style.dart';
// import 'package:di_state_managment/resource/app_colors.dart';
// import 'package:di_state_managment/resource/dimens.dart';
// import 'package:flutter/material.dart';

// class ProductPrice extends StatelessWidget {
//   const ProductPrice(int price, {
//     super.key,
//     required this.discount,
//   });

//   final dynamic discount;

//   @override
//   Widget build(BuildContext context) {
// final num parsedDiscount = 
//     (discount is num) ? discount : num.tryParse(discount.toString()) ?? 0;

// final bool hasDiscount = parsedDiscount > 0;   
//  return Row(
//       mainAxisAlignment:
//           MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text( "65000 تومان",style: LightAppTextStyle.title,),
            
//             Visibility(
//               visible:hasDiscount,
//               child: Text(900000.seperatedWithComa,style: LightAppTextStyle.oldPrice,)),
//           ],
//         ),
//         Visibility(
//           visible: hasDiscount,
//           child: Container(
//             padding: EdgeInsets.all(
//               Dimens.small * .5,
//             ),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(60),
//               color: LightAppColors.discountColor,
//             ),
//             child: Text(
//               "20%",
//               style: LightAppTextStyle.discountText,
//             ),
//           ),
//         ),
        
//       ],
//     );
//   }
// }