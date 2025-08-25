import 'dart:async';

import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/resource/app_colors.dart';
import 'package:di_state_managment/resource/dimens.dart';
import 'package:di_state_managment/screens/main_screen/product_single_screen.dart';
import 'package:di_state_managment/utils/format_time.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    
    super.key,
    
    this.discount = 0,
    this.specialExpiration = "",
    this.oldPriceT = 0,
    required this.productName,
    required this.price,
    required this.image
  });
final String image;
final String productName;
final int  price;
final int oldPriceT;
final int discount;
final String specialExpiration;

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
    if (widget.specialExpiration.isNotEmpty) {
     DateTime expiration = DateTime.parse(widget.specialExpiration);
    _duration = expiration.difference(now);
    inSeconds = _duration.inSeconds;
    if (inSeconds>0) {
       startTimer();
    }
   
    } else {
      inSeconds = 0;
    }
   

  }
  @override
  Widget build(BuildContext context) {
    bool isExpired = inSeconds <=0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
         MaterialPageRoute(builder: (context) => ProductSingleScreen(
          
         ),));
      },
      child: Container(
        padding: EdgeInsets.all(Dimens.small),
        margin: EdgeInsets.all(Dimens.medium),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            Dimens.medium,
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: LightAppColors.productPage,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height/9.5,
              child: Image(image: NetworkImage(widget.image),fit: BoxFit.contain,)),
            Dimens.medium.height,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.productName,
                style: LightAppTextStyle.prodactTitle,
              ),
            ),
            Dimens.medium.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.price.seperatedWithComa}  تومان",
                style: LightAppTextStyle.title,),
                if(widget.discount >0 && !isExpired)
                Text("${widget.oldPriceT.seperatedWithComa}  تومان",
                style: LightAppTextStyle.oldPrice,)
              ],
            ),
           
                   if(!isExpired && widget.discount >0)           
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.red
              ),
              child: 
              Text("${widget.discount}%"),
             
            ),
           
              Dimens.large.height,                
              if(!isExpired)
              Column(
                children: [
              Container(
              height: 2,
              width: double.infinity,
              color: Colors.blue,
            ),
            Dimens.medium.height,
            Text(formatTime(inSeconds),
            style: LightAppTextStyle.prodTimerStyle,)
                ],
              )
          ],
        ),
        
      ),
    );
  }
   void startTimer(){
      const oneSec = Duration(seconds: 1);
      timer = Timer.periodic(oneSec, (timer){
        setState(() {
          if(inSeconds <= 0){
            timer.cancel();
          }else{
            inSeconds--;
          }
        });
      });
    }
  
}
