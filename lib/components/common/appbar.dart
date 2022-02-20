import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  final String text;
  final IconButton? leadingIconButton;
  final TextButton actionTextButton;

  const Appbar({
    Key? key,
    required this.appBar,
    this.text = '',
    this.leadingIconButton,
    required this.actionTextButton,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline4,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: context.vRouter.historyCanBack() ? leadingIconButton : null,
      actions: [
        actionTextButton,
      ],
    );
  }
}
