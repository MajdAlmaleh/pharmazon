import 'package:flutter/material.dart';
import 'package:pharmazon/generated/l10n.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSearch;

  const CustomSearchBar(
      {super.key, required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: controller,
          onChanged: (value) {
            if(controller.text.trim().isNotEmpty){
            onSearch(controller.text);
            }
          },
          decoration: InputDecoration(
            hintText: S.of(context).search,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => onSearch(controller.text),
            ),
          ),
        ),
      ),
    );
  }
}
