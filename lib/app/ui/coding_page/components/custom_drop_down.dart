import 'package:flutter/material.dart';
import 'package:flutter_codal/app/core/ui/color_palette.dart';
import 'package:flutter_codal/app/core/ui/core_ui.dart';
import 'package:flutter_codal/app/ui/components/codal_svg.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    Key? key,
    required this.itemList,
    required this.isDark,
    required this.onChange,
    required this.selectedItem,
    this.hint,
    this.height = 30,
  }) : super(key: key);

  final List<String> itemList;
  final String? selectedItem;
  final double height;
  final bool isDark;
  final String? hint;
  final Function(String value) onChange;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

/// TODO Items expanded
class _CustomDropDownState extends State<CustomDropDown> {
  bool isOpen = false;

  final GlobalKey _key = GlobalKey();

  Widget _item(String selectedItem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            selectedItem,
            style: widget.isDark
                ? Spoqa.textTabEnableDark_s16_w500_h16
                : Spoqa.textTabEnable_s16_w500_h16,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const CodalSvg(fileName: 'keyboard_arrow_bottom'),
      ],
    );
  }

  Widget _dropItem({required String text, required bool isLast}) {
    return GestureDetector(
      onTap: () {
        widget.onChange(text);
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: isLast ? 0 : 18),
        child: Text(
          text,
          style: widget.isDark
              ? Spoqa.textTabEnableDark_s16_w500_h16
              : Spoqa.textTabEnable_s16_w500_h16,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  void _show() async {
    final RenderBox renderBox =
        _key.currentContext?.findRenderObject() as RenderBox;
    Offset pos = renderBox.localToGlobal(Offset.zero);
    Size size = renderBox.size;

    List<String> dropItemList = widget.itemList
        .where((element) => element != widget.selectedItem)
        .toList();

    List<Widget> children = [];
    int itemCnt = dropItemList.length;
    for (int i = 0; i < itemCnt; i++) {
      children.add(_dropItem(
          text: dropItemList[i], isLast: i == itemCnt - 1 ? true : false));
    }

    await showDialog(
        context: _key.currentContext!,
        barrierColor: Colors.transparent,
        useSafeArea: false,
        barrierDismissible: true,
        builder: (context) {
          return Stack(
            children: [
              Positioned(
                  left: pos.dx,
                  top: pos.dy + widget.height - 2,
                  child: Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                      border:
                          Border.all(color: widget.isDark
                              ? ColorPalette.cFF2C3136
                              : ColorPalette.cFF767676, width: 1),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  )),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: _key,
      onTap: () {
        _show();
        setState(() {
          isOpen = !isOpen;
        });
      },
      child: Column(
        children: [
          Container(
            height: widget.height,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    width: 2,
                    color: widget.isDark
                        ? ColorPalette.cFF2C3136
                        : ColorPalette.cFF767676),
              ),
            ),
            child: _item(widget.selectedItem == ''
                ? widget.itemList.first
                : widget.selectedItem!),
          ),
        ],
      ),
    );
  }
}
