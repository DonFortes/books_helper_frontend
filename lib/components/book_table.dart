// Flutter imports:

import 'package:books_library/api.dart';
import 'package:data_table_2/data_table_2.dart';
// Flutter imports:
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uiblock/uiblock.dart';

// Project imports:
import '../../providers/book_provider.dart';
import '../providers/book_fields_provider.dart';
import '../providers/column_state_provider.dart';

class BooksDataSource extends DataTableSource {
  BooksDataSource({
    required this.context,
    required this.books,
  });

  final BuildContext context;
  late List<Book> books;

  void sort<T>(Comparable<T> Function(Book r) getField, bool ascending) {
    books.sort((Book a, Book b) {
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
    });
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= books.length) throw 'index > singlePushStats.length';
    final Book book = books[index];

    // List<DataRow> allDataRows = [];
    List<DataCell> rowWithCells = <DataCell>[];
    if (context.watch<ColumnsStateProvider>().bookNameIsVisible) {
      rowWithCells.add(DataCell(SelectableText(book.name)));
    }
    if (context.watch<ColumnsStateProvider>().bookTitleIsVisible) {
      book.title == null
          ? rowWithCells.add(const DataCell(SelectableText('-')))
          : rowWithCells.add(DataCell(SelectableText(book.title!)));
    }
    if (context.watch<ColumnsStateProvider>().bookAuthorIsVisible) {
      rowWithCells.add(DataCell(SelectableText(book.author)));
    }
    if (context.watch<ColumnsStateProvider>().bookDescriptionIsVisible) {
      book.description == null
          ? rowWithCells.add(const DataCell(SelectableText('-')))
          : rowWithCells.add(DataCell(SelectableText(book.description!)));
    }
    if (context.watch<ColumnsStateProvider>().bookPriceIsVisible) {
      rowWithCells.add(DataCell(SelectableText(book.price.toString())));
    }
    if (rowWithCells.isNotEmpty) {
      rowWithCells.add(
        DataCell(
          Row(
            children: <Widget>[
              IconButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(70, 40),
                ),
                onPressed: () async {
                  // UIBlock.block(context);
                  context.read<BookFieldsProvider>().setBookName(book.name);
                  if (book.title != null && book.title != '') {
                    context.read<BookFieldsProvider>().setBookTitle(book.title!);
                  }
                  context.read<BookFieldsProvider>().setBookAuthor(book.author);
                  if (book.description != null && book.description != '') {
                    context.read<BookFieldsProvider>().setBookDescription(book.description!);
                  }
                  context.read<BookFieldsProvider>().setBookPrice(book.price.toString());
                  context.read<BookFieldsProvider>().method = "UPDATE";
                  context.read<BookFieldsProvider>().bookId = book.id;
                  // UIBlock.unblock(context);
                },
                icon: const Icon(Icons.update),
              ),
            ],
          ),
        ),
      );
    }
    if (rowWithCells.isNotEmpty) {
      rowWithCells.add(
        DataCell(
          Row(
            children: <Widget>[
              IconButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: const Size(70, 40),
                ),
                onPressed: () async {
                  final bool? result = await showDialog<bool>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Удалить?'),
                      content: const Text('Это действие удалит выбранный объект'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          child: const Text('Отмена'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, true),
                          child: const Text('Удалить'),
                        ),
                      ],
                    ),
                  );

                  if (result == null || !result) {
                    return;
                  }

                  UIBlock.block(context);
                  await context.read<BookProvider>().deleteBook(book.id);
                  UIBlock.unblock(context);
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ),
      );
    }

    return DataRow2.byIndex(
      index: index,
      cells: rowWithCells,
    );
  }

  @override
  int get rowCount => books.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
// ---------------------------------------------------------------------------------------------------------------------

class BooksTable extends StatefulWidget {
  const BooksTable({super.key});

  @override
  State<BooksTable> createState() => _BooksTableState();
}

class _BooksTableState extends State<BooksTable> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextStyle style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    List<DataColumn> columns = [];
    if (context.watch<ColumnsStateProvider>().bookNameIsVisible) {
      columns.add(const DataColumn2(
        label: Text('Имя'),
        size: ColumnSize.S,
      ));
    }
    if (context.watch<ColumnsStateProvider>().bookTitleIsVisible) {
      columns.add(const DataColumn2(
        label: Text('Заголовок'),
        size: ColumnSize.M,
      ));
    }
    if (context.watch<ColumnsStateProvider>().bookAuthorIsVisible) {
      columns.add(const DataColumn2(
        label: Text('Автор'),
        size: ColumnSize.S,
      ));
    }
    if (context.watch<ColumnsStateProvider>().bookDescriptionIsVisible) {
      columns.add(const DataColumn2(
        label: Text('Описание'),
        size: ColumnSize.M,
      ));
    }
    if (context.watch<ColumnsStateProvider>().bookPriceIsVisible) {
      columns.add(const DataColumn2(
        label: Text('Цена'),
        size: ColumnSize.S,
      ));
    }
    if (!context.watch<ColumnsStateProvider>().allColumnsUnchecked()) {
      columns.add(const DataColumn2(
        label: Text('Изменить'),
        size: ColumnSize.S,
      ));
    }
    if (!context.watch<ColumnsStateProvider>().allColumnsUnchecked()) {
      columns.add(const DataColumn2(
        label: Text('Удалить'),
        size: ColumnSize.S,
      ));
    }

    return FutureBuilder(
        future: context.watch<BookProvider>().books,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData && !context.read<ColumnsStateProvider>().allColumnsUnchecked()) {
            return Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          height: 40,
                          child: Text(
                            'Список книг',
                            textAlign: TextAlign.left,
                            style: style.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 25,
                                color: theme.colorScheme.onSurface.withOpacity(0.7)),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: PaginatedDataTable2(
                            isHorizontalScrollBarVisible: true,
                            autoRowsToHeight: true,
                            showCheckboxColumn: false,
                            renderEmptyRowsInTheEnd: false,
                            wrapInCard: false,
                            columnSpacing: 12,
                            horizontalMargin: 12,
                            minWidth: 600,
                            columns: columns,
                            source: BooksDataSource(context: context, books: snapshot.data.results)),
                      ),
                    ),
                  ],
                ));
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.web_asset_rounded,
                    size: 64,
                  ),
                  Text('Нет данных для отображения', style: TextStyle(fontSize: 16))
                ],
              ),
            );
          }
        });
  }
}
