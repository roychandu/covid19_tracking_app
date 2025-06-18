import 'package:flutter/material.dart';
import 'animate_counter.dart'; // Make sure this import is correct

class ReuseableRow extends StatefulWidget {
  final String title;
  final String value;

  const ReuseableRow({super.key, required this.title, required this.value});

  @override
  State<ReuseableRow> createState() => _ReuseableRowState();
}

class _ReuseableRowState extends State<ReuseableRow> {
  @override
  Widget build(BuildContext context) {
    int numericValue = int.tryParse(widget.value) ?? 0;

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
                AnimatedCounter(
                  value: numericValue,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
