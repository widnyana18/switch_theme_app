import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:switch_theme_app/controllers/analytical_notifier.dart';
import 'package:switch_theme_app/controllers/analytical_state.dart';
import 'package:switch_theme_app/controllers/theme_notifier.dart';
import 'package:switch_theme_app/widgets/analytical_bar.dart';

class FlexibleHeaderDelegate extends SliverPersistentHeaderDelegate {
  FlexibleHeaderDelegate(this.maxHeight);
  final double maxHeight;

  @override
  double get minExtent => 50;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var theme = Theme.of(context);
    var isCollapse = shrinkOffset > maxExtent / 4;

    return SizedBox.expand(
      child: Container(
        color: theme.backgroundColor,
        // elevation: isCollapse ? 16 : 0,
        child: AnimatedCrossFade(
          crossFadeState:
              isCollapse ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          firstChild: ListTile(
            title: Text('Keep the device running fast',
                style: theme.textTheme.titleLarge),
            tileColor: theme.canvasColor,
          ),
          secondChild: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: isCollapse ? 0 : 1,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.read<ThemeNotifier>().switching();
                      },
                      icon: Selector<ThemeNotifier, bool>(
                        builder: (context, isDark, child) => AnimatedCrossFade(
                          crossFadeState: !isDark
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: Duration(seconds: 1),
                          firstChild: Icon(Icons.dark_mode_outlined),
                          secondChild: Icon(Icons.light_mode_outlined),
                        ),
                        selector: (p0, p1) => p1.isDark,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.settings_outlined),
                    ),
                  ],
                ),
                Expanded(
                  child: ChangeNotifierProvider<AnalyticalNotifier>(
                    create: (context) => AnalyticalNotifier(),
                    child: AnalyticalBar(),
                  ),
                ),
              ],
            ),
          ),
          duration: Duration(seconds: 1),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(FlexibleHeaderDelegate oldDelegate) => true;
}
