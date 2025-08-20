
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:di_state_managment/widgets/product_items.dart';
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
           
            CartBadge(),
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
        ),
        
        body: Column(

          children: [

            TagList(),
            (Dimens.large*3).height,
            ProductGridView()
          ],
        ),
      
      ),
    );
  }
}






class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsetsGeometry.symmetric(
      vertical: Dimens.medium,
    ),
    child: SizedBox(height: 24,
    
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      reverse: true,
      itemCount: 6,
      itemBuilder: (context, index) {
      
      return Container(
        margin: EdgeInsets.symmetric(horizontal: Dimens.small),
        padding: EdgeInsets.symmetric(horizontal: Dimens.small),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(Dimens.large)
        ),
        child: Center(child: Text("تیو فورس",style: LightAppTextStyle.taglistStyle,)),
      );
    },) ,),);
  }
}
class ProductGridView
 extends StatelessWidget {
  const ProductGridView
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: 
      GridView.builder(
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          childAspectRatio: 0.77,
          mainAxisSpacing: 2),
        
         itemBuilder: (context, index) {

           return ProductItem(productName: "productName", price: 100);

         },)
      )
    ;
  }
}