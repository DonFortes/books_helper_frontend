// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/column_state_provider.dart';

class ColumnsSelector extends StatefulWidget {
  const ColumnsSelector({super.key});

  @override
  State<ColumnsSelector> createState() => _ColumnsSelectorState();
}

class _ColumnsSelectorState extends State<ColumnsSelector> {
  bool nameIsSelected = true;
  bool titleIsSelected = true;
  bool authorIsSelected = true;
  bool descriptionIsSelected = true;
  bool priceIsSelected = true;

  // @override
  // initState() {
  //   super.initState();
  //   context.read<ColumnsStateProvider>().clearValues();
  // }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
              child: Text(
                'Выбор колонок',
                style: style.copyWith(
                    fontWeight: FontWeight.w300, fontSize: 25, color: colorScheme.onSurface.withOpacity(0.7)),
              ),
            ),
            SizedBox(
              height: 37,
              child: CheckboxListTile(
                title: const Text('Имя'),
                value: nameIsSelected,
                onChanged: (newValue) {
                  context.read<ColumnsStateProvider>().setNameVisibility(newValue!);
                  setState(() {
                    nameIsSelected = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            SizedBox(
              height: 37,
              child: CheckboxListTile(
                title: const Text('Заголовок'),
                value: titleIsSelected,
                onChanged: (bool? newValue) {
                  context.read<ColumnsStateProvider>().setTitleVisibility(newValue!);
                  setState(() {
                    titleIsSelected = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            SizedBox(
              height: 37,
              child: CheckboxListTile(
                title: const Text('Автор'),
                value: authorIsSelected,
                onChanged: (bool? newValue) {
                  context.read<ColumnsStateProvider>().setAuthorVisibility(newValue!);
                  setState(() {
                    authorIsSelected = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            SizedBox(
              height: 37,
              child: CheckboxListTile(
                title: const Text('Описание'),
                value: descriptionIsSelected,
                onChanged: (bool? newValue) {
                  setState(() {
                    context.read<ColumnsStateProvider>().setDescriptionVisibility(newValue!);
                    descriptionIsSelected = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20.0)),
            SizedBox(
              height: 37,
              child: CheckboxListTile(
                title: const Text('Цена'),
                value: priceIsSelected,
                onChanged: (bool? newValue) {
                  context.read<ColumnsStateProvider>().setPriceVisibility(newValue!);
                  setState(() {
                    priceIsSelected = newValue;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading, //  <-- leading Checkbox
              ),
            ),
          ],
        ),
      ),
    );
  }
}
