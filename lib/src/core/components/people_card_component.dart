import 'package:flutter/material.dart';

class PeopleCardComponent extends StatelessWidget {
  const PeopleCardComponent({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.leftFunc,
    required this.rightFunc,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function() leftFunc;
  final Function() rightFunc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: leftFunc,
            icon: const Icon(
              Icons.edit,
            ),
          ),
          IconButton(
            onPressed: rightFunc,
            icon: const Icon(
              Icons.delete_forever,
            ),
          ),
        ],
      ),
    );
  }
}
