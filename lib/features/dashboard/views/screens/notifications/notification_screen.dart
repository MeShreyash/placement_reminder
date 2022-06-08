import 'package:flutter/material.dart';

import '../../../../../shared_components/header_text.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderText("Notifications/Updates"),
        const Spacer(),
        // const SizedBox(width: 10),
      ],
    );
  }
}
