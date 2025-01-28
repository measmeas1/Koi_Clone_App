// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_final_fields, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables

import 'package:assignment/themes/theme_logic.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  final Map<String, dynamic> item;
  const OrderScreen({super.key, required this.item});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String selectedCupSize = 'M';
  String selectedSugarLevel = '70%';
  String selectedIceLevel = 'Normal Ice';
  List<String> selectedToppings = [];
  String? selectedToppingLevel;
  int quantity = 1;
 
  Map<String, double> toppingPrices = {
    'Konjac Jelly': 0.1,
    'Konjac Ball': 0.1,
    'Aloe Vera': 0.1,
    'Coconut Jelly': 0.1,
    'Grass Jelly': 0.1,
    'Red Bean': 0.1,
    'Pudding': 0.1,
    'Taro Ball': 0.1,
  };

   double calculatePriceForSize(String size) {
    // Extract the base price (small size)
    double basePrice = double.tryParse(widget.item["order"][0]["price"].replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;

    // Adjust based on size
    switch (size) {
      case 'M':  // Medium size
        return basePrice + 0.8;
      case 'L':  // Large size
        return basePrice + 0.8 + 0.7;  // Base price + Medium adjustment + Large adjustment
      default:  // Default to small size
        return basePrice;
    }
  }

  // Calculate subtotal
  double calculateSubtotal() {
    double toppingCost = selectedToppings
        .map((topping) => toppingPrices[topping] ?? 0)
        .fold(0, (a, b) => a + b);

    // Calculate the subtotal based on the selected cup size (S, M, L)
    double sizePrice = calculatePriceForSize(selectedCupSize);
    
    return (sizePrice + toppingCost) * quantity;
  }


  @override
  Widget build(BuildContext context) {
    ThemeMode _themeMode = context.watch<ThemeLogic>().mode;

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.item["order"][0]["product_name"]),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: _themeMode == ThemeMode.dark
                  ? Colors.black
                  : Colors.grey.shade200,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.item["order"][0]["screen"]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.item["order"][0]["product_name"],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                // CUP SIZE
                _buildSectionTitle('Cup Size', '1 Required'),
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: ['S', 'M', 'L'].map((size) {
                  return _buildSelectableButton(
                    size,
                    '\$${calculatePriceForSize(size).toStringAsFixed(2)}',
                    selectedCupSize,
                    (value) {
                      setState(() {
                        selectedCupSize = value;
                      });
                    },
                  );
                }).toList(),
                ),

                const SizedBox(height: 24),

                // SUGAR LEVEL
                _buildSectionTitle('Sugar Level', '1 Required'),
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: ['0%', '25%', '50%', '70%', '100%', '120%']
                      .map((level) => _buildSelectableButton(
                            level,
                            '',
                            selectedSugarLevel,
                            (value) {
                              setState(() {
                                selectedSugarLevel = value;
                              });
                            },
                          ))
                      .toList(),
                ),

                const SizedBox(height: 24),

                // ICE LEVEL
                _buildSectionTitle('Ice Level', '1 Required'),
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: ['No Ice', 'Less Ice', 'Normal Ice', 'More Ice']
                      .map((level) => _buildSelectableButton(
                            level,
                            '',
                            selectedIceLevel,
                            (value) {
                              setState(() {
                                selectedIceLevel = value;
                              });
                            },
                          ))
                      .toList(),
                ),

                const SizedBox(height: 24),

                // TOPPING
                _buildSectionTitle('Topping', ''),
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: toppingPrices.keys.map((topping) {
                    return _buildSelectableButton(
                      topping,
                      '+\$${toppingPrices[topping]!.toStringAsFixed(2)}',
                      selectedToppings.contains(topping) ? topping : '',
                      (value) {
                        setState(() {
                          if (selectedToppingLevel == 'No Topping') {
                            return; // Do nothing if "No Topping" is selected
                          }
                          if (selectedToppings.contains(topping)) {
                            selectedToppings.remove(topping);
                          } else if (selectedToppings.length < 2) {
                            selectedToppings.add(topping);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),

                const SizedBox(height: 24),

                // TOPPING LEVEL
                _buildSectionTitle('Topping Level (Optional)', ''),
                GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    'No Topping',
                    'Less Topping',
                    'Normal Topping',
                    'More Topping'
                  ]
                      .map((level) => _buildSelectableButton(
                            level,
                            '',
                            selectedToppingLevel ?? '',
                            (value) {
                              setState(() {
                                selectedToppingLevel = value;

                                // If "No Topping" is selected, clear any selected toppings
                                if (value == 'No Topping') {
                                  selectedToppings.clear();
                                }
                              });
                            },
                          ))
                      .toList(),
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height:
              150, // Fixed height for the bottom container // Background color for the container
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: _themeMode == ThemeMode.dark ? Colors.black : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: _themeMode == ThemeMode.dark
                      ? Colors.white.withOpacity(0.4)
                      : Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ]),
          child: Column(
              mainAxisSize:
                  MainAxisSize.min, // Ensures the content fits its size
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${calculateSubtotal().toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Quantity Control
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if (quantity > 1) {
                              setState(() {
                                quantity--;
                              });
                            }
                          },
                          icon: Icon(Icons.remove, color: Colors.orange),
                        ),
                        Text(
                          '$quantity',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.orange),
                        ),
                      ],
                    ),

                    // Add to Cart Button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        minimumSize:
                            const Size(300, 50), // Make the button size fixed
                      ),
                      child: const Text(
                        'ADD TO CART',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ));
  }

  Widget _buildSelectableButton(String title, String subtitle,
      String selectedValue, Function(String) onTap,
      {IconData? icon}) {
    bool isSelected = selectedValue == title;

    ThemeMode _themeMode = context.watch<ThemeLogic>().mode;

    // Determine the background color based on theme mode and selection
    Color backgroundColor = _themeMode == ThemeMode.dark
        ? (isSelected ? Colors.orange : Colors.grey[800]!)
        : (isSelected ? Colors.orange : Colors.grey[200]!);

    // Determine the border color based on theme mode and selection
    Color borderColor = _themeMode == ThemeMode.dark
        ? (isSelected ? Colors.orange : Colors.grey[600]!)
        : (isSelected ? Colors.orange : Colors.grey[400]!);

    return GestureDetector(
      onTap: () => onTap(title),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderColor,
              width: 2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                Icon(icon,
                    size: 20,
                    color: isSelected ? Colors.white : Colors.grey[700]),
              const SizedBox(height: 4),
              Text(title,
                  style: const TextStyle(
                    fontSize: 16,
                  )),
              if (subtitle.isNotEmpty)
                Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      color: isSelected ? Colors.white : Colors.grey.shade600),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(fontSize: 14, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
