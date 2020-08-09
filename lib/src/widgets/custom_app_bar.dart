import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> widgets;
  final AppBar appBar;

  const CustomAppBar({Key key, this.title, this.widgets, this.appBar})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        width: double.infinity,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
      actions: widgets,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
