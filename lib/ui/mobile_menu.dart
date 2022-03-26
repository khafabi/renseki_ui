import 'package:flutter/material.dart';
import 'package:renseki_ui/models/menu.dart';
import 'package:renseki_ui/ui/widget/renseki_menu.dart';
import 'package:renseki_ui/util/app_color.dart';
import 'package:renseki_ui/util/app_font.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final data = [1, 2, 3, 4, 5];
  bool isEdit = false;
  final menuDataSatu = <Menu>[
    Menu(name: 'Penjualan'),
    Menu(name: 'Pembelian'),
    Menu(name: 'Persediaan'),
    Menu(name: 'Kas/Bank'),
    Menu(name: 'Akutansi'),
    Menu(name: 'Laporan'),
    Menu(name: 'Smart List'),
    Menu(name: 'Smart List'),
  ];

  final menuDataDua = <Menu>[];

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      ColorConst.rensekiBlue1,
                      ColorConst.rensekiBlue2,
                    ],
                    begin: const Alignment(-1, 1),
                    end: const Alignment(1, -1),
                  ),
                ),
                child: Column()),
          ),
          Expanded(
            flex: 9,
            child: Container(),
          )
        ],
      ),
      Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 30,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorConst.lightWhiteColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.close),
                            const Spacer(),
                            Text(
                              'Semua Menu',
                              style: AppFonts.verySmall(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                      Container(
                        height: const Size.fromHeight(45).height,
                        decoration: BoxDecoration(
                          color: ColorConst.neutral20WhiteColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari Menu yang kamu inginkan...',
                            contentPadding:
                                const EdgeInsets.only(left: 15, top: 8),
                            hintStyle: AppFonts.verySmall(
                              color: ColorConst.neutral50WhiteColor,
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Menu Favorit',
                              style: AppFonts.verySmall(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isEdit = !isEdit;
                                });
                              },
                              child: (isEdit) ? Text("Simpan") : Text('Edit'),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(90, 35),
                                maximumSize: const Size(90, 35),
                                primary: (!isEdit)
                                    ? ColorConst.rensekiBlue1
                                    : ColorConst.lightWhiteColor,
                                onPrimary: (isEdit) ? ColorConst.rensekiBlue1 : ColorConst.lightWhiteColor,
                                textStyle: AppFonts.verySmall(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RensekiMenu(
                        firstData: menuDataSatu,
                        isEdit: isEdit,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Menu Lainnya',
                              style: AppFonts.verySmall(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      RensekiMenu(
                        firstData: menuDataDua,
                        isEdit: isEdit,
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    ]);
  }
}
