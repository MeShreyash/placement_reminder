import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:flutter/material.dart';
import 'package:placement_reminders/constans/app_constants.dart';
import 'package:placement_reminders/shared_components/card_task.dart';
import 'package:placement_reminders/shared_components/list_task_assigned.dart';
import 'package:placement_reminders/shared_components/list_task_date.dart';
import 'package:placement_reminders/shared_components/selection_button.dart';
import 'package:placement_reminders/shared_components/task_progress.dart';
import 'package:placement_reminders/shared_components/user_profile.dart';

class DashboardController extends GetxController {
  final scafoldKey = GlobalKey<ScaffoldState>();

  final dataProfil = const UserProfileData(
    image: AssetImage(ImagePath.logo),
    name: "Shreyash Dubey",
    branch: "ENC",
  );

  final dataTask = const TaskProgressData(totalTask: 5, totalCompleted: 1);

  final taskInProgress = [
    CardTaskData(
      companyName: "Microsoft",
      jobRole: "Software Developer",
      salary: "1 Lac",
      jobType: "Full Time",
      lastDate: DateTime.now().add(const Duration(minutes: 50)),
      branch: 'COE, CSE, ENC',
    ),
    CardTaskData(
      companyName: "Microsoft",
      jobRole: "Software Developer",
      salary: "1 Lac",
      jobType: "Full Time",
      lastDate: DateTime.now().add(const Duration(minutes: 50)),
      branch: 'COE, CSE, ENC',
    ),
    CardTaskData(
      companyName: "Microsoft",
      jobRole: "Software Developer",
      salary: "1 Lac",
      jobType: "Full Time",
      lastDate: DateTime.now().add(const Duration(days: 2)),
      branch: 'COE, CSE, ENC',
    ),
    CardTaskData(
      companyName: "Microsoft",
      jobRole: "Software Developer",
      salary: "1 Lac",
      jobType: "Full Time",
      lastDate: DateTime.now().add(const Duration(minutes: 50)),
      branch: 'COE, CSE, ENC',
    )
  ];
  final recentUpdates = [
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.monitor, color: Colors.blueGrey),
      label: "Slicing UI",
      content: "Programmer",
      editDate: DateTime.now().add(-const Duration(hours: 2)),
    ),
    ListTaskAssignedData(
      icon: const Icon(EvaIcons.star, color: Colors.amber),
      label: "Personal branding",
      content: "Marketing",
      editDate: DateTime.now().add(-const Duration(days: 50)),
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.colorPalette, color: Colors.blue),
      label: "UI UX ",
      content: "Design",
    ),
    const ListTaskAssignedData(
      icon: Icon(EvaIcons.pieChart, color: Colors.redAccent),
      label: "Determine meeting schedule ",
      content: "System Analyst",
    ),
  ];

  final taskGroup = [
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 10)),
        label: "5 posts on instagram",
        jobdesk: "Marketing",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 2, hours: 11)),
        label: "Platform Concept",
        jobdesk: "Animation",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 5)),
        label: "UI UX Marketplace",
        jobdesk: "Design",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 4, hours: 6)),
        label: "Create Post For App",
        jobdesk: "Marketing",
      ),
    ],
    [
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 5)),
        label: "2 Posts on Facebook",
        jobdesk: "Marketing",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 6)),
        label: "Create Icon App",
        jobdesk: "Design",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 8)),
        label: "Fixing Error Payment",
        jobdesk: "Programmer",
      ),
      ListTaskDateData(
        date: DateTime.now().add(const Duration(days: 6, hours: 10)),
        label: "Create Form Interview",
        jobdesk: "System Analyst",
      ),
    ]
  ];

  void onPressedProfil() {}

  void onSelectedMainMenu(int index, SelectionButtonData value) {}
  void onSelectedTaskMenu(int index, String label) {}

  void searchTask(String value) {}

  void onPressedTask(int index, ListTaskAssignedData data) {}
  void onPressedAssignTask(int index, ListTaskAssignedData data) {}
  void onPressedCalendar() {}
  void onPressedTaskGroup(int index, ListTaskDateData data) {}

  void openDrawer() {
    if (scafoldKey.currentState != null) {
      scafoldKey.currentState!.openDrawer();
    }
  }
}
