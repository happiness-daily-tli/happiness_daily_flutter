import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String text;
  final Color? backgroundColor;
  final Widget? leadingIconButton;
  final Widget? actionTextButton;

  const AppbarWidget({
    Key? key,
    required this.appBar,
    this.text = '',
    this.backgroundColor = Colors.transparent,
    this.leadingIconButton,
    this.actionTextButton,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    List<Widget> getList() {
      List<Widget> childs = [];
      if (actionTextButton != null) {
        childs.add(actionTextButton!);
      }
      return childs;
    }

    return AppBar(
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
      backgroundColor: backgroundColor,
      elevation: 0.0,
      leading: context.vRouter.historyCanBack() ? leadingIconButton : null,
      actions: getList(),
    );
  }
}
