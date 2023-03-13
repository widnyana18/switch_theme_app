import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:switch_theme_app/controllers/analytical_notifier.dart';
import 'package:switch_theme_app/controllers/analytical_state.dart';
import 'package:switch_theme_app/utils/custom_oval_clip.dart';

class AnalyticalBar extends StatefulWidget {
  @override
  State<AnalyticalBar> createState() => _AnalyticalBarState();
}

class _AnalyticalBarState extends State<AnalyticalBar> {
  // @override
  // initState() {
  //   super.initState();
  //   Future.microtask(() => context.read<AnalyticalNotifier>().analyze());
  // }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txtTheme = theme.textTheme;
    final width = MediaQuery.of(context).size.width;
    final state = context
        .select<AnalyticalNotifier, AnalyticalState>((value) => value.state);

    Widget ovalShape(int key, Curve curve) => AnimatedRotation(
          key: ValueKey(key),
          duration: Duration(milliseconds: state.time),
          turns: state is InitialAnalytical ? 1 : 8,
          curve: curve,
          child: ClipOval(
            clipper: CustomClipOval(),
            child: AnimatedContainer(
              duration: Duration(milliseconds: state.time),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(state.status!.value.colors[2]),
                    Color(state.status!.value.colors[3])
                        .withOpacity(key == 2 ? .6 : 1),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        );

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: state.time),
          constraints: BoxConstraints.tight(Size.square(
              state is InitialAnalytical ? width * .77 : width * .68)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(state.status!.value.colors[0]),
                Color(state.status!.value.colors[1]),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        ovalShape(1, Curves.easeIn),
        ovalShape(2, Curves.easeInOut),
        Container(
          constraints: BoxConstraints.tight(
              Size.square(MediaQuery.of(context).size.width * .6)),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(state.percentage.toString(), style: txtTheme.displayMedium),
              Text(
                state is Analyzing ? 'Optimizing...' : state.status!.value.msg,
                style: txtTheme.bodySmall?.copyWith(
                  color: Color(state.status!.value.colors[1]),
                ),
              ),
              OutlinedButton(onPressed: () {}, child: Text('Optimize'))
            ],
          ),
        ),
      ],
    );
  }
}
