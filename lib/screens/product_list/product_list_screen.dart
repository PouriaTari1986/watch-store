import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/data/repo/product_repo.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/screens/product_list/bloc/product_list_bloc.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:di_state_managment/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ProductListScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables, strict_top_level_inference
  final param;
  const ProductListScreen({super.key, this.param});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productListBloc = ProductListBloc(productRepository);
        productListBloc.add(ProductListInIt(param: param));

        return productListBloc;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CartBadge(),
                Row(
                  children: [
                    Text(AppStrings.bestSelled),
                    Dimens.small.width,
                    SvgPicture.asset(Assets.svg.list),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(Assets.svg.close),
                ),
              ],
            ),
          ),

          body: Column(
            children: [
              TagList(),
              (Dimens.large * 3).height,
              BlocBuilder<ProductListBloc, ProductListState>(
                builder: (context, state) {
                  if (state is ProductListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is ProductListLoaded) {
                    return Expanded(
                      child: GridView.builder(
                        itemCount: state.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 2,
                          childAspectRatio: 0.77,
                          mainAxisSpacing: 2,
                        ),

                        itemBuilder: (context, index) {
                          return ProductItem(
                            productName: state.productList[index].title,
                            price: state.productList[index].price,
                            discount: state.productList[index].discount,
                            oldPriceT: state.productList[index].discountPrice,
                            specialExpiration:
                                state.productList[index].specialExpiration,
                            image: state.productList[index].image, 
                            id: state.productList[index].id,
                          );
                        },
                      ),
                    );
                  } else if (state is ProductListError) {
                    return const Text("error");
                  } else {
                    throw Exception("invalid state");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TagList extends StatelessWidget {
  const TagList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: Dimens.medium),
      child: SizedBox(
        height: 24,

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
                borderRadius: BorderRadius.circular(Dimens.large),
              ),
              child: Center(
                child: Text("تیو فورس", style: LightAppTextStyle.taglistStyle),
              ),
            );
          },
        ),
      ),
    );
  }
}
