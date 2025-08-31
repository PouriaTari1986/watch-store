// product_list_screen.dart
import 'package:di_state_managment/data/repo/cart_repo.dart';
import 'package:di_state_managment/widgets/product_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:di_state_managment/data/repo/product_repo.dart';
import 'package:di_state_managment/widgets/cart_badges.dart';
import 'package:di_state_managment/screens/product_list/bloc/product_list_bloc.dart';
import 'package:di_state_managment/resource/dimens.dart';

class ProductListScreen extends StatelessWidget {
  final param;
  final String? title;
  const ProductListScreen({super.key, this.param, this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = ProductListBloc(productRepository);
        bloc.add(ProductListInIt(param: param));
        return bloc;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(title ?? ""),
            actions: [
              ValueListenableBuilder(
                valueListenable: cartRepository.cartCount,
                builder: (_, value, __) => CartBadge(count: value),
              ),
            ],
          ),
          body: BlocBuilder<ProductListBloc, ProductListState>(
            builder: (context, state) {
              if (state is ProductListLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is ProductListLoaded) {
                return GridView.builder(
                  padding: EdgeInsets.all(Dimens.medium),
                  itemCount: state.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: Dimens.medium,
                    crossAxisSpacing: Dimens.medium,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (_, index) => ProductItem(product: state.productList[index]),
                );
              } else {
                return Center(child: Text("خطا در بارگذاری محصولات"));
              }
            },
          ),
        ),
      ),
    );
  }
}
