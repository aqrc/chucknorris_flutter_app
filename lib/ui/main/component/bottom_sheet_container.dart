import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_widget_model.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categories = context.watch<MainWidgetModel>().categories;
    if (categories.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    var categoryChips = categories.entries
        .map((e) => FilterChip(
              selected: e.value,
              onSelected: (bool value) =>
                  context.read<MainWidgetModel>().toggleCategory(e.key),
              label: Text(e.key),
            ))
        .toList();

    return Container(
      padding: const EdgeInsets.only(left: 5),
      child: Wrap(
        spacing: 5,
        runSpacing: -10,
        children: categoryChips,
      ),
    );
  }
}
