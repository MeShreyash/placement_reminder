import 'package:dotted_border/dotted_border.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:placement_reminders/utils/helpers/app_helpers.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../constans/app_constants.dart';

class ListTaskAssignedData {
  final Icon icon;
  final String label;
  final String content;
  final DateTime? editDate;

  const ListTaskAssignedData({
    required this.icon,
    required this.label,
    required this.content,
    this.editDate,
  });
}

class ListTaskAssigned extends StatelessWidget {
  const ListTaskAssigned({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final ListTaskAssignedData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      hoverColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      leading: _buildIcon(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      // trailing: _buildAssign(),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: data.icon,
    );
  }

  Widget _buildTitle() {
    return Text(
      data.label,
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    String edit = "";

    if (data.editDate != null) {
      edit = " \u2022 Updated ${timeago.format(data.editDate!)}";
    } else {
      edit = data.content;
    }

    return Text(
      edit,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Widget _buildAssign() {
  //   return (data.assignTo != null)
  //       ? InkWell(
  //           onTap: onPressedMember,
  //           borderRadius: BorderRadius.circular(22),
  //           child: Tooltip(
  //             message: data.assignTo!,
  //             child: CircleAvatar(
  //               radius: 22,
  //               backgroundColor: Colors.orange.withOpacity(.2),
  //               child: Text(
  //                 data.assignTo!.getInitialName(2).toUpperCase(),
  //                 style: const TextStyle(
  //                   color: Colors.orange,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //           ),
  //         )
  //       : DottedBorder(
  //           color: kFontColorPallets[1],
  //           strokeWidth: .3,
  //           strokeCap: StrokeCap.round,
  //           borderType: BorderType.Circle,
  //           child: IconButton(
  //             onPressed: onPressedAssign,
  //             color: kFontColorPallets[1],
  //             iconSize: 15,
  //             icon: const Icon(EvaIcons.plus),
  //             splashRadius: 24,
  //             tooltip: "assign",
  //           ),
  //         );
  // }
}
