import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';

import 'package:placement_reminders/utils/helpers/app_helpers.dart';

class CardTaskData {
  final String companyName;
  final String jobRole;
  final String salary;
  final String jobType;
  final String branch;
  final DateTime lastDate;

  const CardTaskData({
    required this.companyName,
    required this.jobRole,
    required this.salary,
    required this.jobType,
    required this.branch,
    required this.lastDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'companyName': companyName,
      'jobRole': jobRole,
      'salary': salary,
      'jobType': jobType,
      'branch': branch,
      'lastDate': lastDate.millisecondsSinceEpoch,
    };
  }

  factory CardTaskData.fromMap(Map<String, dynamic> map) {
    return CardTaskData(
      companyName: map['companyName'] ?? '',
      jobRole: map['jobRole'] ?? '',
      salary: map['salary'] ?? '',
      jobType: map['jobType'] ?? '',
      branch: map['branch'] ?? '',
      lastDate: DateTime.fromMillisecondsSinceEpoch(map['lastDate']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CardTaskData.fromJson(String source) =>
      CardTaskData.fromMap(json.decode(source));

  CardTaskData copyWith({
    String? companyName,
    String? jobRole,
    String? salary,
    String? jobType,
    String? branch,
    DateTime? lastDate,
  }) {
    return CardTaskData(
      companyName: companyName ?? this.companyName,
      jobRole: jobRole ?? this.jobRole,
      salary: salary ?? this.salary,
      jobType: jobType ?? this.jobType,
      branch: branch ?? this.branch,
      lastDate: lastDate ?? this.lastDate,
    );
  }

  @override
  String toString() {
    return 'CardTaskData(companyName: $companyName, jobRole: $jobRole, salary: $salary, jobType: $jobType, branch: $branch, lastDate: $lastDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CardTaskData &&
        other.companyName == companyName &&
        other.jobRole == jobRole &&
        other.salary == salary &&
        other.jobType == jobType &&
        other.branch == branch &&
        other.lastDate == lastDate;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^
        jobRole.hashCode ^
        salary.hashCode ^
        jobType.hashCode ^
        branch.hashCode ^
        lastDate.hashCode;
  }
}

class CardTask extends StatelessWidget {
  const CardTask({
    required this.data,
    required this.primary,
    required this.onPrimary,
    Key? key,
  }) : super(key: key);

  final CardTaskData data;
  final Color primary;
  final Color onPrimary;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 250,
            height: 180,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [primary, primary.withOpacity(.7)],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: _BackgroundDecoration(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildCompanyName(),
                              _bookmarkButton(),
                            ],
                          ),
                          const SizedBox(height: 6),
                          _buildJobRole(),
                        ],
                      ),
                    ),
                    // const Spacer(flex: 1),
                    Container(
                      // alignment: AlignmentDirectional.bottomStart,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _salary(),
                              SizedBox(
                                height: 20,
                                child: VerticalDivider(
                                  thickness: 1,
                                  color: onPrimary,
                                ),
                              ),
                              _buildDate(),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _branch(),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _jobType(),
                              // SizedBox(
                              //   height: 20,
                              //   child: VerticalDivider(
                              //     thickness: 1,
                              //     color: onPrimary,
                              //   ),
                              // ),
                              // _buildHours(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCompanyName() {
    return Text(
      data.companyName,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w800,
        color: onPrimary,
        letterSpacing: 1,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildJobRole() {
    return Container(
      decoration: BoxDecoration(
        color: onPrimary.withOpacity(.3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        data.jobRole,
        style: TextStyle(
          color: onPrimary,
          fontSize: 10,
          letterSpacing: 1,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _salary() {
    return _IconLabel(
      color: onPrimary,
      iconData: FontAwesomeIcons.rupeeSign,
      label: data.salary,
    );
  }

  Widget _jobType() {
    return _IconLabel(
      color: onPrimary,
      iconData: FontAwesomeIcons.clock, //EvaIcons.clockOutline,
      label: data.jobType,
    );
  }

  Widget _branch() {
    return _IconLabel(
      color: onPrimary,
      iconData: FontAwesomeIcons.codeBranch,
      label: data.branch,
    );
  }

  Widget _buildDate() {
    return _IconLabel(
      color: onPrimary,
      iconData: FontAwesomeIcons.calendarDay, //EvaIcons.calendarOutline,
      label: DateFormat('d MMM').format(data.lastDate),
    );
  }

  Widget _buildHours() {
    return _IconLabel(
      color: onPrimary,
      iconData: EvaIcons.clockOutline,
      label: data.lastDate.dueDate(),
    );
  }

  Widget _bookmarkButton() {
    return _Icon(
      color: onPrimary,
      iconData: EvaIcons.bookmarkOutline,
      branch: '',
    );
  }
}

class _Icon extends StatelessWidget {
  const _Icon({
    required this.color,
    required this.iconData,
    Key? key,
    required String branch,
  }) : super(key: key);

  final Color color;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {},
          child: Icon(
            iconData,
            color: color,
            size: 22,
          ),
        ),
      ],
    );
  }
}

class _IconLabel extends StatelessWidget {
  const _IconLabel({
    required this.color,
    required this.iconData,
    // required this.icon,
    required this.label,
    Key? key,
  }) : super(key: key);

  final Color color;
  final IconData iconData;
  // final Icon icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: color,
          size: 18,
        ),
        const SizedBox(width: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: color.withOpacity(.8),
          ),
        )
      ],
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration({required this.child, Key? key})
      : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Transform.translate(
            offset: const Offset(25, -25),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Transform.translate(
            offset: const Offset(-70, 70),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white.withOpacity(.1),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
