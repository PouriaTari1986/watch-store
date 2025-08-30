import 'dart:async';

import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/data/models/product.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/screens/product_single/product_single_screen.dart';
import 'package:di_state_managment/utils/format_time.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
   ProductItem({
    super.key,
    required this.product

  });
Product product;
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Duration _duration = Duration(seconds: 0);
  late Timer timer;
  late int inSeconds;
  @override
  void initState() {
    super.initState();
    
  
      DateTime now = DateTime.now();
      DateTime expiration = DateTime.parse(widget.product.specialExpiration);
      _duration = now.difference(expiration).abs();
       inSeconds = _duration.inSeconds;
      if (inSeconds > 0) {
        startTimer();
      
    } 
  }

  @override
Widget build(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(Dimens.small),
    margin: EdgeInsets.all(Dimens.medium),
    constraints: BoxConstraints(
      maxWidth: 200,
      maxHeight: MediaQuery.sizeOf(context).height / 3,
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductSingleScreen(id: widget.product.id),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 9.5,
            child: Image.network(
              widget.product.image,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: Dimens.medium),
          Text(
            widget.product.title,
            style: LightAppTextStyle.title.copyWith(fontWeight: FontWeight.normal),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
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
              if (_duration.inSeconds > 0 && widget.product.discount ==0)
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
          if (_duration.inSeconds > 0 && widget.product.discount == 0)
            Text(
              "${widget.product.discountPrice.seperatedWithComa} تومان",
              style: LightAppTextStyle.oldPrice,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          if (_duration.inSeconds > 0 && widget.product.discount == 0) ...[
            SizedBox(height: Dimens.small),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.blue,
            ),
            SizedBox(height: Dimens.medium),
            Align(
              alignment: AlignmentGeometry.center,
              child: Text(
                formatTime(inSeconds),
                style: LightAppTextStyle.prodTimerStyle.copyWith(color: Colors.blue,fontWeight: FontWeight.bold)),
              ),
           
          ],
        ],
      ),
    ),
  );
}


  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (inSeconds <= 0) {
          timer.cancel();
          setState(() {
            
          });
        } else {
          setState(() {
            inSeconds--;
          });
          
        }
      });
    });
  }
}
