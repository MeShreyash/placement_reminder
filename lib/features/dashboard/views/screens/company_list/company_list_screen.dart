import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:placement_reminders/shared_components/header_text.dart';

class CompanyListScreen extends StatefulWidget {
  const CompanyListScreen({ Key? key }) : super(key: key);

  @override
  State<CompanyListScreen> createState() => _CompanyListScreenState();
}

class _CompanyListScreenState extends State<CompanyListScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HeaderText("Companies"),
        const Spacer(),
        // _buildArchive(),
        const SizedBox(width: 10),
        _buildAddNewButton(),
      ],
    );
  }
}

Widget _buildAddNewButton() {
    return ElevatedButton.icon(
      icon: const Icon(
        EvaIcons.plus,
        size: 16,
      ),
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
      ),
      label: const Text("New"),
    );
  }