// product_item.dart
import 'dart:async';
import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/screens/product_single/product_single_screen.dart';
import 'package:flutter/material.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/data/models/product.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/utils/format_time.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  const ProductItem({super.key, required this.product});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late Timer? timer;
  late int inSeconds;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    DateTime expiration = DateTime.tryParse(widget.product.specialExpiration) ?? now;
    inSeconds = expiration.difference(now).inSeconds;
    if (inSeconds > 0) startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (!mounted) return;
      setState(() {
        if (inSeconds > 0) {
          inSeconds--;
        } else {
          timer?.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Dimens.small),
      margin: EdgeInsets.all(Dimens.medium),
      constraints: BoxConstraints(
        maxWidth: 200,
        maxHeight: MediaQuery.of(context).size.height / 3,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.medium),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: LightAppColors.productPage,
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => ProductSingleScreen(id: widget.product.id)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 9.5,
              child: Image.network(widget.product.image, fit: BoxFit.contain),
            ),
            SizedBox(height: Dimens.medium),
            Flexible(
              child: Text(
                widget.product.title,
                style: LightAppTextStyle.title.copyWith(fontWeight: FontWeight.normal),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: Dimens.medium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    "${widget.product.price.seperatedWithComa} تومان",
                    style: LightAppTextStyle.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (inSeconds > 0 && widget.product.discount > 0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.red,
                    ),
                    child: Text("${widget.product.discount}%"),
                  ),
              ],
            ),
            if (inSeconds > 0 && widget.product.discount > 0) ...[
              Text(
                "${widget.product.discountPrice.seperatedWithComa} تومان",
                style: LightAppTextStyle.oldPrice,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: Dimens.small),
              Container(height: 2, width: double.infinity, color: Colors.blue),
              SizedBox(height: Dimens.medium),
              Center(
                child: Text(formatTime(inSeconds),
                    style: LightAppTextStyle.prodTimerStyle.copyWith(color: Colors.blue)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
