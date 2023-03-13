import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:switch_theme_app/utils/flexible_header_delegate.dart';
import 'package:switch_theme_app/utils/menus.dart';
import 'package:switch_theme_app/widgets/tool_card.dart';

class DashboardView extends StatefulWidget {
  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  var _current = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;
    final scheme = theme.colorScheme;

    return Scaffold(
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        headerSliverBuilder: ((context, innerBoxIsScrolled) => [
              SliverPersistentHeader(
                delegate: FlexibleHeaderDelegate(
                    MediaQuery.of(context).size.width * .92),
                pinned: true,
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: menus.entries.map((entry) {
              if (entry.key == 'main') {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Table(
                    children: entry.value.entries
                        .map(
                          (row) => TableRow(
                            children: row.value.map(
                              (item) {
                                var isTarget = row.key == 2 &&
                                    item.title!.contains('Manage');
                                return GestureDetector(
                                  onTap: () {},
                                  child: Card(
                                    margin: EdgeInsets.all(6),
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Stack(
                                            children: [
                                              ClipOval(
                                                child: Image.asset(
                                                  'assets/images/${item.icon!}',
                                                  width: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Positioned(
                                                top: 4,
                                                right: 6,
                                                child: Offstage(
                                                  offstage: !isTarget,
                                                  child: Container(
                                                    padding: EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: theme.canvasColor,
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          theme.errorColor,
                                                      radius: 3,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 12),
                                          Text(
                                            item.title!,
                                            style: txtTheme.titleMedium
                                                ?.copyWith(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: isTarget
                                                        ? theme.errorColor
                                                        : scheme.onBackground),
                                          ),
                                          Text(
                                            item.desc!,
                                            style: txtTheme.labelMedium
                                                ?.copyWith(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: isTarget
                                                        ? theme.errorColor
                                                        : scheme
                                                            .primaryContainer),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                          ),
                        )
                        .toList(),
                  ),
                );
              } else if (entry.key == 'advanced') {
                var items = entry.value.values;
                return Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 6),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        items: [
                          for (var item in items)
                            ...item.map((menu) => ToolCard(menu)).toList(),
                        ],
                        options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 1.6,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var item in items)
                              ...item
                                  .asMap()
                                  .keys
                                  .map((key) => Container(
                                        width: 6,
                                        height: 6,
                                        margin: EdgeInsets.symmetric(
                                            vertical: 8.0, horizontal: 4.0),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: _current == key
                                              ? scheme.primaryContainer
                                              : scheme.secondaryContainer,
                                        ),
                                      ))
                                  .toList(),
                          ]),
                    ],
                  ),
                );
              } else {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Table(
                    children: entry.value.values
                        .map(
                          (item) => TableRow(
                            children: item
                                .map((menu) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 20),
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: Column(
                                          children: [
                                            ClipOval(
                                              child: Image.asset(
                                                'assets/images/${menu.icon!}',
                                                width: 40,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Text(
                                              menu.title!,
                                              textAlign: TextAlign.center,
                                              style: txtTheme.titleMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
                        .toList(),
                  ),
                );
              }
            }).toList(),
          ),
        ),
      ),
    );
  }
}
