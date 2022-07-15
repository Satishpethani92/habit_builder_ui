import 'package:flutter/material.dart';
import 'package:habit_builder_ui/core/model_class/notch_shape.dart';
import 'package:habit_builder_ui/ui/widget/tab_item.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({required this.onSelectTab, required this.tabs});

  final ValueChanged<int> onSelectTab;
  final List<TabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CurveDraw(),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        elevation: 0,
        items: tabs
            .map(
              (e) => _buildItem(
                index: e.getIndex(),
                image: e.image.toString(),
                tabName: e.tabName,
              ),
            )
            .toList(),
        onTap: (index) => onSelectTab(
          index,
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildItem({int? index, String? image, String? tabName}) {
    return BottomNavigationBarItem(
      icon: SizedBox(width: 50, height: 45, child: Image.asset(image ?? '')),
      label: '',
    );
  }
}
