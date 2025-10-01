import 'package:flutter/material.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_slider.dart';

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
  // Methods
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

  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    //add style to text
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(title: const Text('UTip')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
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
                    '\$0.00',
                    style: style.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontSize: theme.textTheme.displaySmall?.fontSize,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: theme.colorScheme.primary, width: 2),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print(value);
                    },
                    decoration: InputDecoration(
                      labelText: 'Bill Amount',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.attach_money,
                        color: theme.colorScheme.primary,
                      ),
                    ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tip', style: theme.textTheme.titleMedium),
                      Text('\$0.00', style: theme.textTheme.titleMedium),
                    ],
                  ),
                  // Tip section (now after split)
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
                    onChanged: (double value) => {
                      setState(() {
                        tipPercentage = value;
                      }),
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
