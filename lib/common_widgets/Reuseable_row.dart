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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.title, style: TextStyle(fontSize: 20)),
                Text(widget.value, style: TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
