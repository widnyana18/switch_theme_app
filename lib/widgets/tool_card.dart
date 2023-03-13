import 'package:flutter/material.dart';
import 'package:switch_theme_app/utils/menus.dart';

class ToolCard extends StatelessWidget {
  const ToolCard(this.data);
  final Menus data;
  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {},
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Padding(
          padding: EdgeInsets.fromLTRB(14, 16, 16, 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'assets/images/${data.icon!}',
                            width: 40,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(width: 18),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title!, style: txtTheme.titleMedium),
                              Text(data.desc!, style: txtTheme.bodySmall),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 18),
                  Icon(Icons.navigate_next_rounded),
                ],
              ),
              SizedBox(height: 15),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/${data.bg!}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
