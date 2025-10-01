import 'package:flutter/material.dart';
import 'package:utip/widgets/bill_amount.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {
  int personCount = 1;
  double tipPercentage = 0.0;
  double billTotal = 0.0;

  double get tipAmount => billTotal * tipPercentage;
  double get totalBill => billTotal + tipAmount;
  double get totalPerPerson => personCount > 0 ? totalBill / personCount : 0.0;

  void incrementPerson() {
    setState(() {
      personCount = personCount + 1;
    });
  }

  void decrementPerson() {
    setState(() {
      if (personCount > 1) personCount = personCount - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('UTip')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(
            theme: theme,
            style: style,
            totalPerPerson: totalPerPerson,
          ),
          //Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  BillAmount(
                    theme: theme,
                    billAmount: billTotal.toStringAsFixed(2),
                    onChanged: (String value) {
                      setState(() {
                        billTotal = double.tryParse(value) ?? 0.0;
                      });
                    },
                  ),
                  // Split bill section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Split', style: theme.textTheme.titleMedium),
                      PersonCounter(
                        theme: theme,
                        personCount: personCount,
                        onIncrement: incrementPerson,
                        onDecrement: decrementPerson,
                      ),
                    ],
                  ),
                  // Tip section (after split)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip', style: theme.textTheme.titleMedium),
                      Text(
                        '\$${tipAmount.toStringAsFixed(2)}',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${(tipPercentage * 100).toStringAsFixed(0)}%',
                        style: theme.textTheme.titleMedium,
                      ),
                    ],
                  ),
                  // Slider
                  TipSlider(
                    tipPercentage: tipPercentage,
                    onChanged: (double value) {
                      setState(() {
                        tipPercentage = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
