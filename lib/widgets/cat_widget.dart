import 'package:di_state_managment/componnet/extension.dart';
import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/gen/assets.gen.dart';
import 'package:di_state_managment/resorse/dimens.dart';
import 'package:flutter/material.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({
    required this.color,
    required this.iconPath,
    required this.title,
    required this.onTap,
    super.key,
  });
 final AssetGenImage iconPath; 
final List<Color> color;  
final VoidCallback onTap;
final String title;
  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.sizeOf(context);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(Dimens.small),
            height: size.height * 0.08,
            width: size.height * 0.08,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimens.large),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors:color
              ),
            ),
            child: iconPath.image(fit: BoxFit.contain)
          ),
          (Dimens.small/2).height,
          Text(title, style: LightAppTextStyle.title.copyWith(fontSize: 18)),
        ],
      ),
    );
  }
}
