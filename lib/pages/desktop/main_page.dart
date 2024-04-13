// Flutter imports:
import 'package:flutter/material.dart';

import '../../components/book_table.dart';
import '../../components/column_selector.dart';
import '../../components/create_book_bar.dart';
// Package imports:

// Project imports:
import '../../components/left_side_bar.dart';
import '../../constant_objects.dart';

class SingleDispatchDesktopPage extends StatelessWidget {
  const SingleDispatchDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: <Widget>[
        SizedBox(
            width: leftBarWidth,
            child: LeftSideBar(
              extended: true,
              selectedIndex: 0,
            )),
        VerticalDivider(width: 1),
        SizedBox(
          width: bookAddingBarWidth,
          child: SingleDispatchBar(),
        ),
        VerticalDivider(width: 1),
        SizedBox(
          width: selectorColumnsWidth,
          child: ColumnsSelector(),
        ),
        VerticalDivider(width: 1),
        Expanded(
          child: BooksTable(),
        ),
      ],
    );
  }
}
