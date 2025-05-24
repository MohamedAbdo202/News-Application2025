import 'package:flutter/material.dart';
import 'package:news/common/widgets/shared_form_fields.dart';
import 'package:news/util/app_constants/app_colors.dart';

class SearchInputSection extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  const SearchInputSection({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: defaultFormField(
              context: context,
              controller: controller,
              type: TextInputType.text,
              label: "Enter Keyword then tap button",
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Search must not be empty.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(width: 5),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.blueColor,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            ),
            onPressed: onSearch,
            child: const Icon(Icons.search, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
