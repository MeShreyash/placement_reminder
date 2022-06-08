import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:placement_reminders/config/routes/app_pages.dart';
import 'package:placement_reminders/features/dashboard/views/screens/add_company/add_company_screen.dart';
import 'package:placement_reminders/features/dashboard/views/screens/bookmark/bookmark_screen.dart';
import 'package:placement_reminders/features/dashboard/views/screens/company_list/company_list_screen.dart';
import 'package:placement_reminders/features/dashboard/views/screens/dashboard_screen.dart';
import 'package:placement_reminders/features/dashboard/views/screens/notifications/notification_screen.dart';

import '../constans/app_constants.dart';

class SelectionButtonData {
  final IconData activeIcon;
  final IconData icon;
  final String label;
  final int? totalNotif;

  SelectionButtonData({
    required this.activeIcon,
    required this.icon,
    required this.label,
    this.totalNotif,
  });
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({
    this.initialSelected = 0,
    required this.data,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final int initialSelected;
  final List<SelectionButtonData> data;
  final Function(int index, SelectionButtonData value) onSelected;

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  late int selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.data.asMap().entries.map((e) {
        final index = e.key;
        final data = e.value;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: _Button(
            selected: selected == index,
            onPressed: () {
              widget.onSelected(index, data);
              setState(() {
                selected = index;
              });
              switch (index) {
                case 1:
                  Get.to(() => const DashboardScreen());
                  break;
                // PopupMenuButton(
                //   child: Center(child: Text('click here')),
                //   itemBuilder: (context) {
                //     return List.generate(3, (postIndex) {
                //       return PopupMenuItem(
                //         onTap: () => (postIndex),
                //         switch (postIndex) {
                //           case 1:
                //             Get.to(() => const AddCompanyScreen());
                //             break;
                //             case 2:
                //             Get.to(() => const AddCompanyScreen());
                //             break;
                //             case 3:
                //             Get.to(() => const AddCompanyScreen());
                //             break;

                //         }
                //         child: Text('button no $index'),
                //       );
                //     });
                //   },
                // );
                // break;
                case 2:
                  Get.to(() => const DashboardScreen());
                  break;
                case 3:
                  Get.to(() => const NotificationScreen());
                  break;
                case 4:
                  Get.to(() => const CompanyListScreen());
                  break;
                case 5:
                  Get.to(() => const BookmarkScreen());
                  break;

                default:
                  Get.to(() => const DashboardScreen());
              }

              Get.to(() => const AddCompanyScreen());
            },
            data: data,
          ),
        );
      }).toList(),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: widget.data.asMap().entries.map((e) {
//         final index = e.key;
//         final data = e.value;

//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: popButton(
//             selected: selected == index,
//             onPressed: () {
//               widget.onSelected(index, data);
//               setState(() {
//                 selected = index;
//               });
//               switch (index) {
//                 case 1:
//                   Get.to(() => const DashboardScreen());
//                   break;
//                 // PopupMenuButton(
//                 //   child: Center(child: Text('click here')),
//                 //   itemBuilder: (context) {
//                 //     return List.generate(3, (postIndex) {
//                 //       return PopupMenuItem(
//                 //         onTap: () => (postIndex),
//                 //         switch (postIndex) {
//                 //           case 1:
//                 //             Get.to(() => const AddCompanyScreen());
//                 //             break;
//                 //             case 2:
//                 //             Get.to(() => const AddCompanyScreen());
//                 //             break;
//                 //             case 3:
//                 //             Get.to(() => const AddCompanyScreen());
//                 //             break;

//                 //         }
//                 //         child: Text('button no $index'),
//                 //       );
//                 //     });
//                 //   },
//                 // );
//                 // break;
//                 case 2:
//                   Get.to(() => const DashboardScreen());
//                   break;
//                 case 3:
//                   Get.to(() => const NotificationScreen());
//                   break;
//                 case 4:
//                   Get.to(() => const CompanyListScreen());
//                   break;
//                 case 5:
//                   Get.to(() => const BookmarkScreen());
//                   break;

//                 default:
//                   Get.to(() => const DashboardScreen());
//               }
//               Get.to(() => const AddCompanyScreen());
//             },
//             data: data,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }

class _Button extends StatelessWidget {
  const _Button({
    required this.selected,
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color:
          (!selected) ? null : Theme.of(context).primaryColor.withOpacity(.1),
      borderRadius: BorderRadius.circular(kBorderRadius),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              _buildIcon(),
              const SizedBox(width: kSpacing / 2),
              Expanded(child: _buildLabel()),
              if (data.totalNotif != null)
                Padding(
                  padding: const EdgeInsets.only(left: kSpacing / 2),
                  child: _buildNotif(),
                )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      (!selected) ? data.icon : data.activeIcon,
      size: 20,
      color: (!selected)
          ? kFontColorPallets[1]
          : Theme.of(Get.context!).primaryColor,
    );
  }

  Widget _buildLabel() {
    return Text(
      data.label,
      style: TextStyle(
        color: (!selected)
            ? kFontColorPallets[1]
            : Theme.of(Get.context!).primaryColor,
        fontWeight: FontWeight.bold,
        letterSpacing: .8,
        fontSize: 14,
      ),
    );
  }

  Widget _buildNotif() {
    return (data.totalNotif == null || data.totalNotif! <= 0)
        ? Container()
        : Container(
            width: 30,
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              (data.totalNotif! >= 100) ? "99+" : "${data.totalNotif}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
  }
}

class popButton extends StatelessWidget {
  const popButton({
    required this.selected,
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final bool selected;
  final SelectionButtonData data;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material();
  }
}
