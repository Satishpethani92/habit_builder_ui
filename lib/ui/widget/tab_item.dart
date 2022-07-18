import 'package:flutter/material.dart';
import 'package:habit_builder_ui/ui/all_screen/home_bottom.dart';

class TabItem {
  final String? tabName;
  String? image;
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  int _index = 0;
  Widget? _page;

  TabItem({
    this.tabName,
    this.image,
    required Widget page,
  }) {
    _page = page;
  }

  void setIndex(int i) {
    _index = i;
  }

  int getIndex() => _index;

  Widget get page {
    return Visibility(
      visible: _index == HomeBottomState.currentTab,
      maintainState: true,
      child: Navigator(
        key: key,
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (_) => _page!,
          );
        },
      ),
    );
  }
}
