import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({super.key, required this.tipPercentage, this.onChanged});

  final double tipPercentage;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 1,
      value: tipPercentage,
      label: '${(tipPercentage * 100).toStringAsFixed(0)}%',
      onChanged: onChanged,
    );
  }
}
