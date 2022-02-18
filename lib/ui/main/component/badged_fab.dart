import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main_widget_model.dart';
import 'bottom_sheet_container.dart';

class BadgedFab extends StatelessWidget {
  const BadgedFab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: Colors.white,
      position: BadgePosition.topEnd(top: -5, end: -5),
      badgeContent: Text(
          context.watch<MainWidgetModel>().selectedCategoriesCount.toString()),
      child: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          context: context,
          builder: (BuildContext context) {
            return const BottomSheetContainer();
          },
        ),
        tooltip: 'Select categories',
        child: const Icon(Icons.category),
      ),
    );
  }
}
