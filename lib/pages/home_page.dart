import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductInfo {
  final String name;
  final double price;

  ProductInfo(this.name, this.price);
}

final product = [
  ProductInfo('Wireless mouse', 5),
  ProductInfo('Keyboard', 5.5),
  ProductInfo('Camera', 0.5),
  ProductInfo('iPad', 1.5),
  ProductInfo('PC', 10.5),
  ProductInfo('Laptop', 4.5),
];

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentProductIndex = 0;
  double? _initInputValue;
  String? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Text(product[_currentProductIndex].name),
              TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    _initInputValue = double.tryParse(value);
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 0.8),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            print('_currentProductIndex $_currentProductIndex');
                            print(product[_currentProductIndex].price);
                            print(_initInputValue);
                            _result = _initInputValue ==
                                    product[_currentProductIndex].price
                                ? 'pass'
                                : 'fail';
                          });
                        },
                        child: Text('Check')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.8),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_currentProductIndex == product.length - 1) {
                              _currentProductIndex = 0;
                            } else {
                              _currentProductIndex++;
                            }
                          });
                        },
                        child: Text('Next')),
                  ),
                ],
              ),
              Text(_result.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
