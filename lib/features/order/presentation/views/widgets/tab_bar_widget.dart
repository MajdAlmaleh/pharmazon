// orders_view_body.dart

import 'package:flutter/material.dart';

import 'tab_item.dart';

class TabBarWidget extends StatelessWidget {
  final Function(int) onTabChange;

  const TabBarWidget({Key? key, required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: TabBar(
        onTap: onTabChange,
        indicatorColor: Colors.transparent,
        unselectedLabelColor: Colors.grey[700],
        dividerColor: Colors.grey,
        tabs: const [
          TabItem(label: 'All'),
          TabItem(label: 'Reports'),
        ],
      ),
    );
  }
}
