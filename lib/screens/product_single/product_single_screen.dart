import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/data/models/product_details.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/screens/product_single/bloc/product_single_bloc.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../data/repo/product_repo.dart';

class ProductSingleScreen extends StatelessWidget {
  final int id;
  const ProductSingleScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productBloc = ProductSingleBloc(
         productRepository
        );
        productBloc.add(ProductSingleInIt(id: id));
        return productBloc;
      },
      child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is ProductSingleLoading) {
            return const Scaffold(body:  Center(child: CircularProgressIndicator(),));
          } else if(state is ProductSingleLoaded){
            final product = state.productDetails;
          return SafeArea(
            child: Scaffold(
              appBar: CustomAppBar(
                child: Row(
                  children: [
                    CartBadge(),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          product.title,
                          style: LightAppTextStyle.prodactTitle,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: ()=>Navigator.pop(context),
                      icon: SvgPicture.asset(Assets.svg.close),
                    ),
                  ],
                ),
              ),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Image.network(
                          product.image,
                          
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if(loadingProgress == null)return child;
                            return const SizedBox(
                              height: 200,
                              child: Center(child: CircularProgressIndicator(),),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              height: 200,
                              child: Center(child: Icon(Icons.error),),
                            );
                          },
                        ),
                        Container(
                          margin: EdgeInsets.all(Dimens.medium),
                          padding: EdgeInsets.all(Dimens.medium),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(Dimens.medium),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.brand,
                                  style: LightAppTextStyle.title,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  product.title,
                                  style: LightAppTextStyle.caption,
                                  textDirection: TextDirection.rtl,
                                ),
                              ),

                              Divider(),

                              PruductTabView(productDetails: product,),
                              60.0.height,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: Dimens.medium,
                    right: Dimens.medium,
                    child: SizedBox(
                     
                      height: 60,
                      child: MainBottun(
                        text: AppStrings.addToBs, 
                        onPressed: (){}, 
                        style: AppButtonStyle.mainButtonStyle),
                      
                      ),
                            ),
                          ],
                        ),
                      ),
                    );
            
         
          }else if(state is ProductSingleError){
            return Text("error");
          }else{
            throw Exception("invalid request");
          }
        },
      ),
    );
  }
}

class PruductTabView extends StatefulWidget {
  final ProductDetails productDetails;
  const PruductTabView( {super.key,required this.productDetails });

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
            itemExtent: MediaQuery.sizeOf(context).width / 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(Dimens.medium),
                  child: Text(
                    tabs[index],
                    style: index == selectedTabIndex
                        ? LightAppTextStyle.selectedTab
                        : LightAppTextStyle.unSelectedTab,
                  ),
                ),
              );
            },
          ),
        ),
        IndexedStack(
          index: selectedTabIndex,
          children: [
          CommentList(comments: widget.productDetails.comments,), 
          Review(text: widget.productDetails.description,), 
          
          PropertiesList(properties:widget.productDetails.properties)],
        ),
      ],
    );
  }
}

List<String> tabs = [
  AppStrings.comments,
  AppStrings.review,
  AppStrings.details,
];

class PropertiesList extends StatelessWidget {
  final List<ProductProperty> properties;
  const PropertiesList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
     ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: properties.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = properties[index];
        return Container(
          padding: EdgeInsets.all(Dimens.medium),
          margin: EdgeInsets.all(Dimens.medium),
          width: double.infinity,
          color: LightAppColors.surfaceColor,
          child:Text("${item.property}${item.value}",
          style: LightAppTextStyle.caption,textAlign: TextAlign.right,) ,
        );
      },));
  }
}



class CommentList extends StatelessWidget {
  final List<ProductComment> comments;
  const CommentList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return Expanded(child:
     ListView.builder(
      physics: ClampingScrollPhysics(),
      itemCount: comments.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = comments[index];
        return Container(
          padding: EdgeInsets.all(Dimens.medium),
          margin: EdgeInsets.all(Dimens.medium),
          width: double.infinity,
          color: LightAppColors.surfaceColor,
          child:Text("${item.user}${item.body}",
          style: LightAppTextStyle.caption,textAlign: TextAlign.right,) ,
        );
      },));
  }
}

class Review extends StatelessWidget{

  final String text;
  const Review({super.key, required this.text});


  
  @override
  Widget build(BuildContext context) {
    return Text(text);
  }

  
}
