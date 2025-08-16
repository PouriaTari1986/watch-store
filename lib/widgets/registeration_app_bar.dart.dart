import 'package:di_state_managment/componnet/text_style.dart';
import 'package:di_state_managment/resorse/strings.dart';
import 'package:flutter/material.dart';

class RegisterationAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RegisterationAppBar({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(size.width, size.height * 0.1),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: Icon(Icons.arrow_back),
            ),

            Text(AppStrings.register, style: LightAppTextStyle.title),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size.height * 0.1);
}
