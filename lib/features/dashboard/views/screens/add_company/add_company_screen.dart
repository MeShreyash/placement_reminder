import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../shared_components/header_text.dart';

String companyName = "";
String jobProfile = "";
String salary = "";
String jobType = "";
DateTime lastDate = DateTime.utc(1989, 11, 9);
String info = "";

class AddCompanyScreen extends StatefulWidget {
  const AddCompanyScreen({Key? key}) : super(key: key);

  @override
  State<AddCompanyScreen> createState() => _AddCompanyScreenState();
}

class _AddCompanyScreenState extends State<AddCompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderText("New Company Details"),
        const Spacer(),
        // const SizedBox(width: 10),
        _inputName(),
        // _inputJobProfile(),
        // _inputSalary(),
        // _inputJobType(),
        // _inputLastDate(),
        // _inputInfo(),
      ],
    );
  }
}

Widget _inputName() {
  return TextField(
    onChanged: (value) {
      companyName = value;
    },
    decoration: InputDecoration(
      prefixIcon: const Icon(EvaIcons.shoppingBagOutline),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(width: .1),
      ),
      hintText: "Enter Company Name",
    ),
    // TextInputAction? textInputAction,
    // TextInputType: TextInputType.
  ); 
}
