part of dashboard;

class _RecentUpdates extends StatelessWidget {
  const _RecentUpdates({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final List<ListTaskAssignedData> data;
  final Function(int index, ListTaskAssignedData data) onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: data
          .asMap()
          .entries
          .map(
            (e) => ListTaskAssigned(
              data: e.value,
              onPressed: () => onPressed(e.key, e.value),
            ),
          )
          .toList(),
    );
  }
}
