

import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/app_colors.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:di_state_managment/widgets/product_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(child:
         Row(
          children: [
            CartBadge(count: 2,),
            Expanded(child: Text("productName",style: LightAppTextStyle.prodactTitle,
            textDirection: TextDirection.rtl,)),
            IconButton(
              onPressed: (){}, 
              icon: SvgPicture.asset(Assets.svg.close))
          ],

         )),
         body: Stack(
           children: [
             SingleChildScrollView(
             physics: BouncingScrollPhysics(),
               child: Column(
               
                children: [
                  Image.asset(Assets.png.unnamed.path,
                  fit: BoxFit.cover,
                  width: double.infinity,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(Dimens.medium),
                    padding: EdgeInsets.all(Dimens.medium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.medium),
                      color: Colors.white
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
               
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("benser",style: LightAppTextStyle.title,
                          textDirection: TextDirection.rtl,),
                        ),
               
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("مسواک بنسر مدل اکسترا با برس متوسط 3 عددی",style: LightAppTextStyle.caption,
                          textDirection: TextDirection.rtl,),
                        ),
               
                        Divider(),
               
                        PruductTabView(),
                        60.0.height
                      ],
                    ),
                  )
                ],
               ),
             ),
             Positioned(
              bottom: 0,
              left: 0,
              right: 0,
               child: Container(
                margin: EdgeInsets.all(Dimens.medium),
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: LightAppColors.scaffoldColor
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: Dimens.medium,right: Dimens.medium),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductPrice(discount: 10),
                      
                      SizedBox(
                        height: 55,
                        width: 170,
                        child: MainBottun(text: AppStrings.addToBs, onPressed: (){},
                         style: AppButtonStyle.mainButtonStyle,)),
                        
                    ],
                  ),
                )
               ),
             )
           ],
         ) ,



      ));
  }
}
class PruductTabView extends StatefulWidget {
  const PruductTabView({super.key});

  @override
  State<PruductTabView> createState() => _PruductTabViewState();
}

class _PruductTabViewState extends State<PruductTabView> {

var selectedTabIndex = 2;
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ListView.builder(
            itemCount: tabs.length,
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.sizeOf(context).width/3,
            itemBuilder: (context, index) {
             return GestureDetector(
              onTap: () {
                setState(() {
                  selectedTabIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(Dimens.medium),
                child: Text(tabs[index],
                style: index == selectedTabIndex?LightAppTextStyle.selectedTab:LightAppTextStyle.unSelectedTab,
                ),
              ),
             );
            },),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: [
            Comments(),
            Review(),
            Features(),
        
          ],
        )
      ],
    );
  }
}
List<String> tabs =[

AppStrings.comments,
AppStrings.review,
AppStrings.details,

];
class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("""لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.
""");
  }
}
class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("review");
  }
}
class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Comments");
}
}