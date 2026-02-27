// news/presentation/widgets/category_tabs.dart
import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onTap;

  const CategoryTabs({
    super.key,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final categories = [
      'business',
      'technology',
      'sports',
      'health',
      'entertainment',
    ];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (_, i) {
          final category = categories[i];
          final isSelected = category == selectedCategory;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: ChoiceChip(
              label: Text(
                category.toUpperCase(),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight:
                  isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              selected: isSelected,
              selectedColor: Colors.deepPurple,
              backgroundColor: Colors.grey.shade200,
              onSelected: (_) => onTap(category),
            ),
          );
        },
      ),
    );
  }
}