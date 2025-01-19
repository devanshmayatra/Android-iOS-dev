import 'package:flutter/material.dart';
import 'package:local_storage_todo_app/modules/todo/utils/colorCode.dart';

class Tags extends StatelessWidget {
  const Tags({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(right: 12, left: 12),
      decoration: BoxDecoration(
        color: ColorCode.colorCode(tag),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 2.0,
          color: const Color.fromARGB(255, 127, 127, 127),
        ),
      ),
      child: Center(
        child: Text(
          tag,
        ),
      ),
    );
  }
}
