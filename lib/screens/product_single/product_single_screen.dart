import 'package:di_state_managment/componnet/button_style.dart';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/data/models/product_details.dart';
import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/resource/strings.dart';
import 'package:di_state_managment/screens/cart/bloc/cart_bloc.dart';
import 'package:di_state_managment/screens/product_single/bloc/product_single_bloc.dart';
import 'package:di_state_managment/widgets/app_bar.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:di_state_managment/widgets/main_bottun.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../gen/assets.gen.dart';

class ProductSingleScreen extends StatelessWidget {
  final int id;
  const ProductSingleScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    // استفاده از ProductSingleBloc موجود
    final productBloc = BlocProvider.of<ProductSingleBloc>(context);
    productBloc.add(ProductSingleInIt(id: id)); // فقط یک بار محصول را بارگذاری کن

    return BlocBuilder<ProductSingleBloc, ProductSingleState>(
      builder: (context, state) {
        if (state is ProductSingleLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (state is ProductSingleLoaded) {
          final product = state.productDetails;

          return SafeArea(
            child: Scaffold(
              appBar: CustomAppBar(
                child: Row(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: cartRepository.cartCount,
                      builder: (context, value, widget) {
                        return CartBadge(count: value);
                      },
                    ),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          product.title ?? "بدون عنوان",
                          style: LightAppTextStyle.prodactTitle,
                          textDirection: TextDirection.rtl,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: SvgPicture.asset(Assets.svg.close),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  product.image != null
                      ? Image.network(product.image!, height: 200, fit: BoxFit.cover)
                      : const Icon(Icons.image_not_supported, size: 100),
                  Dimens.large.height,
                  Expanded(child: PruductTabView(productDetails: product)),

                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: MainBottun(
                      text: AppStrings.addToBs,
                      onPressed: () {
                        // فقط وقتی دکمه زده شد، محصول به سبد اضافه و SnackBar نمایش داده می‌شود
                        BlocProvider.of<CartBloc>(context).add(
                          AddToCartEvent(product.id!),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 1),
                            backgroundColor: LightAppColors.succsessColor,
                            content: Text(
                              AppStrings.addToBsSuccsses,
                              style: LightAppTextStyle.caption.copyWith(
                                color: LightAppColors.onSuccsses,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      },
                      style: AppButtonStyle.mainButtonStyle,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const Scaffold(body: Center(child: Text("خطا در بارگذاری محصول")));
        }
      },
    );
  }
}


class PruductTabView extends StatelessWidget {
  final ProductDetails productDetails;
  const PruductTabView({super.key, required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: AppStrings.comments),
              Tab(text: AppStrings.review),
              Tab(text: AppStrings.details),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                CommentList(comments: productDetails.comments ?? []),
                Review(
                  description: HtmlWidget(
                    productDetails.description ?? "بدون توضیحات",
                    textStyle: LightAppTextStyle.caption,
                  ),
                  discussion: HtmlWidget(
                    productDetails.discussion ?? "موردی ثبت نشده",
                    textStyle: LightAppTextStyle.caption,
                  ),
                ),
                PropertiesList(properties: productDetails.properties ?? []),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PropertiesList extends StatelessWidget {
  final List<Properties> properties;
  const PropertiesList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    if (properties.isEmpty) {
      return const Center(child: Text("مشخصاتی موجود نیست"));
    }
    return ListView.builder(
      itemCount: properties.length,
      itemBuilder: (context, index) {
        final item = properties[index];
        return Container(
          padding: const EdgeInsets.all(Dimens.medium),
          margin: const EdgeInsets.all(Dimens.medium),
          width: double.infinity,
          color: LightAppColors.surfaceColor,
          child: Text(
            "${item.property ?? ""}: ${item.value ?? ""}",
            style: LightAppTextStyle.caption,
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}

class CommentList extends StatelessWidget {
  final List<Comments> comments;
  const CommentList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) {
      return const Center(child: Text("نظری ثبت نشده"));
    }
    return ListView.builder(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final item = comments[index];
        return Container(
          padding: const EdgeInsets.all(Dimens.medium),
          margin: const EdgeInsets.all(Dimens.medium),
          width: double.infinity,
          color: LightAppColors.surfaceColor,
          child: Text(
            "${item.user ?? ""}: ${item.body ?? ""}",
            style: LightAppTextStyle.caption,
            textAlign: TextAlign.right,
          ),
        );
      },
    );
  }
}

class Review extends StatelessWidget {
  final Widget description;
  final Widget discussion;

  const Review({
    super.key,
    required this.description,
    required this.discussion,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(Dimens.medium),
      children: [
        const Text(
          "توضیحات",
          style: LightAppTextStyle.title,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        description,
        const Divider(),
        const Text(
          "گفت‌وگو",
          style: LightAppTextStyle.title,
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 8),
        discussion,
      ],
    );
  }
}
