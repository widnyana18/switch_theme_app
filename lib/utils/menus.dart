import 'package:flutter/material.dart';

class Menus {
  const Menus({this.title, this.desc, this.event, this.icon, this.bg});

  final String? title, desc, icon, bg;
  final VoidCallback? event;
}

Map<String, Map<int, List<Menus>>> menus = {
  'main': {
    0: [
      Menus(
        title: 'Cleaner',
        desc: 'Everything looks good',
        icon: 'delete.png',
      ),
      Menus(
        title: 'Scan security',
        desc: 'Scan the device for check virus in all folder file',
        icon: 'scan.png',
      ),
    ],
    1: [
      Menus(
        title: 'Batery & performance',
        desc: '1 day 14 hours left',
        icon: 'batery.png',
      ),
      Menus(
        title: 'Boosting speed',
        desc: 'Clear memory',
        icon: 'boost.png',
      ),
    ],
    2: [
      Menus(
        title: 'Manage App',
        desc: '29 updates available',
        icon: 'manage.png',
      ),
      Menus(
        title: 'Advance cleaning',
        desc: 'Runnning scan for free up storage',
        icon: 'cleaning.png',
      ),
    ],
  },
  'advanced': {
    0: [
      Menus(
        title: 'WhatsApp cleaner',
        desc: 'Delete whatsapp attachment',
        icon: 'clean_wa.png',
        bg: 'wa.png',
      ),
      Menus(
        title: 'Advanced cleaner',
        desc: 'Runnning scan for free up storage',
        icon: 'clean_box.png',
        bg: 'advanced_clean.png',
      ),
      Menus(
        title: 'Lock app',
        desc: 'Protect your payment and pivacy',
        icon: 'lock.png',
        bg: 'security.png',
      ),
      Menus(
        title: 'Dual app',
        desc: 'Each account has the right to have their own app',
        icon: 'clone_app.png',
        bg: 'dual_app.png',
      ),
    ]
  },
  'other': {
    0: [
      Menus(title: 'Solve the issue', icon: 'repair.png'),
      Menus(title: 'Block list', icon: 'block.png'),
      Menus(title: 'Lock app', icon: 'lock2.png'),
    ],
    1: [
      Menus(title: 'Dual app', icon: 'clone_app.png'),
      Menus(title: 'Second room', icon: 'second_room.png'),
      Menus(title: 'Data usage', icon: 'data_usage.png'),
    ],
    2: [
      Menus(title: 'Test signal', icon: 'test_signal.png'),
      Menus(title: 'Game turbo', icon: 'game.png'),
      Menus(title: 'Share me', icon: 'share_me.png'),
    ],
  },
};
