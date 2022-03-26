import 'package:flutter/material.dart';
import 'package:renseki_ui/models/menu.dart';
import 'package:renseki_ui/util/app_color.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';

class RensekiMenu extends StatefulWidget {
  RensekiMenu({
    Key? key,
    required this.firstData,
    required this.secondData,
    required this.isEdit,
  }) : super(key: key);

  List firstData;
  List secondData;
  bool isEdit;

  @override
  State<RensekiMenu> createState() => _RensekiMenuState();
}

class _RensekiMenuState extends State<RensekiMenu> {
  void reorderGrid(oldIndex, newIndex) {
    setState(
      () {
        final element = widget.firstData.removeAt(oldIndex);
        widget.firstData.insert(newIndex, element);
      },
    );
  }

  void moveBetweenList(List firstList, List secondList, Menu menuElement) {
    setState(() {
      secondList.add(menuElement);
      firstList.remove(menuElement);
    });
  }

  Widget buildItem(Menu menu) {
    return Column(
      key: ValueKey(menu),
      children: [
        Expanded(
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      menu.image,
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: Center(
                        child: Text(menu.name),
                      ),
                    ),
                  ),
                ],
              ),
              if (widget.isEdit)
                Positioned(
                  top: 1,
                  left: 0,
                  child: GestureDetector(
                    // onTap: moveBetweenList,
                    child: SizedBox(
                      width: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorConst.rensekiRed,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            color: ColorConst.lightWhiteColor,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(children: [
        Center(
          child: ReorderableGridView.count(
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            onReorder: reorderGrid,
            children: widget.firstData.map((e) => buildItem(e)).toList(),
          ),
        ),
        if (!widget.isEdit)
          Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0)),
          ),
      ]),
    );
  }
}
