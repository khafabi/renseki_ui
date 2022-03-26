import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:renseki_ui/util/app_color.dart';
import 'package:renseki_ui/util/app_font.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<String> taglines = [
    'Satu Aplikasi untuk seluruh Proses Bisnismu',
    'Monitor semua bisnismu dari mana saja & kapan saja',
    'Sesuaikan Fitur-Fitur dengan Kebutuhan Bisnismu',
  ];
  String? activeTagline;
  int globalIndex = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: size.height,
          enableInfiniteScroll: false,
          pageSnapping: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              activeTagline = taglines[index];
              globalIndex = index;
            });
          },
        ),
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/get_started_$i.svg',
                  ),
                  if(i == 2)
                  SizedBox(height: 25),
                ],
              );
            },
          );
        }).toList(),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              activeTagline ?? 'Satu Aplikasi untuk seluruh Proses Bisnismu',
              textAlign: TextAlign.center,
              style: AppFonts.large().copyWith(),
            ),
          ),
          Spacer(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorConst.rensekiBlue1,
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
                onPressed: () {},
                child: Text(
                  "Gabung Sekarang",
                  style: AppFonts.small(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: SizedBox(
              width: size.width * 0.85,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Lewati",
                    style: AppFonts.small(
                      fontWeight: FontWeight.bold,
                      color: ColorConst.gray4Color,
                    ),
                  ),
                  Spacer(),
                  // Expanded(
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     itemCount: 3,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         margin: const EdgeInsets.all(100.0),
                  //         decoration: BoxDecoration(
                  //             color: (index == globalIndex) ? ColorConst
                  //                 .rensekiBlue1 : ColorConst.gray4Color,
                  //             shape: BoxShape.circle
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Text(
                    "Selanjutnya",
                    style: AppFonts.small(
                      fontWeight: FontWeight.bold,
                      color: ColorConst.rensekiBlue1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ]);
  }
}
