import 'package:flutter/material.dart';

class TotalPerPerson extends StatelessWidget {
  const TotalPerPerson({
    super.key,
    required this.theme,
    required this.style,
    required this.totalPerPerson,
  });

  final ThemeData theme;
  final TextStyle style;
  final double totalPerPerson;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.inversePrimary,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Text('Total per Person', style: style),
            Text(
              "\$${totalPerPerson.toStringAsFixed(2)}",
              style: style.copyWith(
                color: theme.colorScheme.onPrimary,
                fontSize: theme.textTheme.displaySmall?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
