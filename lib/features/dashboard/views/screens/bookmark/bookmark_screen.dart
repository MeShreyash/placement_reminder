import 'package:flutter/material.dart';

import '../../../../../shared_components/header_text.dart';


class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderText("Bookmarks"),
        const Spacer(),
        // const SizedBox(width: 10),
        
      ],
    );
  }
}