import 'package:flutter/material.dart';

class RecordTileEditButton extends StatelessWidget {
  final List<String> dropdownList;

  const RecordTileEditButton({
    Key? key,
    this.dropdownList = const ['수정', '삭제'],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 60,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          onChanged: (String? value) {},
          icon: Image.asset(
            'assets/images/common/icon/more.png',
            width: 20,
            height: 20,
          ),
          items: dropdownList.map((String items) {
            final int idx = dropdownList.indexOf(items);

            return DropdownMenuItem(
              value: items,
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: idx + 1 == dropdownList.length
                          ? Colors.transparent
                          : Color(0xFFEEEEEE),
                      width: 1,
                    ),
                  ),
                ), //
                child: Center(
                  child: Text(items),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
    // Material(
    //   color: Colors.white,
    //   child: Container(
    //     width: 20,
    //     height: 20,
    //     child: IconButton(
    //       onPressed: () => print('here'),
    //       icon: Image.asset(
    //         'assets/images/common/icon/more.png',
    //         width: 20,
    //         height: 20,
    //       ),
    //       padding: EdgeInsets.zero,
    //       splashRadius: 10,
    //       splashColor: Theme.of(context).colorScheme.primary,
    //     ),
    //   ),
    // );
  }
}
