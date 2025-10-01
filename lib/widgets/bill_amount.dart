import 'package:flutter/material.dart';

class BillAmount extends StatelessWidget {
  const BillAmount({
    super.key,
    required this.theme,
    required this.billAmount,
    this.onChanged,
  });

  final ThemeData theme;
  final String billAmount;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      decoration: InputDecoration(
        labelText: 'Bill Amount',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.attach_money, color: theme.colorScheme.primary),
      ),
    );
  }
}
