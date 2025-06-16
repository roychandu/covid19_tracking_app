import 'package:flutter/material.dart';

class ReuseableRow extends StatefulWidget {
  String title, value;
  ReuseableRow({super.key, required this.title, required this.value});

  @override
  State<ReuseableRow> createState() => _ReuseableRowState();
}

class _ReuseableRowState extends State<ReuseableRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: [Text(widget.title), Text(widget.value)]),
      ],
    );
  }
}
