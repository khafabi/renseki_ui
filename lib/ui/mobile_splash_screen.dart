import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renseki_ui/util/app_color.dart';
import 'package:renseki_ui/util/app_font.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.2),
              child: SvgPicture.asset(
                'assets/images/yapos_1.svg',
                width: size.width * 0.5,
              ),
            ),
            Column(
              children: [
                Text(
                  "Bisnis jadi mudah",
                  style: AppFonts.large(
                    color: ColorConst.rensekiBlue1,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "di Ujung jari Anda",
                  style: AppFonts.veryLarge(
                      color: ColorConst.rensekiBlue1, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SvgPicture.asset(
              'assets/images/splash_screen.svg',
              height: size.height * 0.45,
            ),
          ],
        ),
    );
  }
}
