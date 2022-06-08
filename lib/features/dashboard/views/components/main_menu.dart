part of dashboard;

class _MainMenu extends StatelessWidget {
  const _MainMenu({
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  final Function(int index, SelectionButtonData value) onSelected;

  @override
  Widget build(BuildContext context) {
    return SelectionButton(
      data: [
        SelectionButtonData(
          activeIcon: EvaIcons.plusSquare,
          icon: EvaIcons.plusSquareOutline,
          label: "Post",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.home,
          icon: EvaIcons.homeOutline,
          label: "Home",
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.bell,
          icon: EvaIcons.bellOutline,
          label: "Notifications",
          totalNotif: 100,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.briefcase,
          icon: EvaIcons.briefcaseOutline,
          label: "Companies",
          totalNotif: 20,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.bookmark,
          icon: EvaIcons.bookmarkOutline,
          label: "Bookmark",
          totalNotif: 20,
        ),
        SelectionButtonData(
          activeIcon: EvaIcons.settings,
          icon: EvaIcons.settingsOutline,
          label: "Settings",
        ),
      ],
      onSelected: onSelected,
    );
  }
}
