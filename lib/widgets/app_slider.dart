

import 'package:carousel_slider/carousel_slider.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';

final List<String> imgList = [
  'https://picsum.photos/id/1011/400/200',
  'https://picsum.photos/id/1015/400/200',
  'https://picsum.photos/id/1016/400/200',
  'https://picsum.photos/id/1025/400/200',
];

class AppSlider extends StatefulWidget {
  const AppSlider({
    
    super.key,
    required this.imgList
  });
final List<String> imgList;
  @override
  State<AppSlider> createState() => _AppSliderState();
}

class _AppSliderState extends State<AppSlider> {
   final CarouselSliderController _controller = CarouselSliderController();
  final List<Widget> items = imgList.map((e)=>

  Padding(
    padding: const EdgeInsets.all(Dimens.medium),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.medium),
      child: Image.network(e,fit: BoxFit.cover,)),
  )
  ).toList();
  
   // ignore: prefer_final_fields
   int _current = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Column(
        children: [
          CarouselSlider(
            carouselController: _controller,
            items: items, 
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              onPageChanged: (index, reason) {
                setState(() {
                   _current = index;
                });
                
              },
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...imgList.asMap().entries.map((e)=>
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () => _controller.animateToPage(e.key),
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == e.key? Colors.black:Colors.grey
                      ),
                    ),
                  ),
                )
                
                )
              ],
              
            )
        ],
      ),
    );
  }
}