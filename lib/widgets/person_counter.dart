import 'package:flutter/material.dart';

class PersonCounter extends StatelessWidget {
  const PersonCounter({
    super.key,
    required this.theme,
    required this.personCount,
    required this.onIncrement,
    required this.onDecrement,
  });

  final ThemeData theme;
  final int personCount;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onDecrement,
          icon: Icon(Icons.remove_circle, color: theme.colorScheme.primary),
        ),
        Text("$personCount", style: theme.textTheme.titleMedium),
        IconButton(
          onPressed: onIncrement,
          icon: Icon(Icons.add_circle, color: theme.colorScheme.primary),
        ),
      ],
    );
  }
}
