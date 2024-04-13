// Flutter imports:

// Package imports:
// Flutter imports:
import 'package:books_library/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Project imports:
import 'package:uiblock/uiblock.dart';

import '../common_functions.dart';
import '../providers/book_fields_provider.dart';
import '../providers/book_provider.dart';
import 'flashbar.dart';

class SingleDispatchBar extends StatefulWidget {
  const SingleDispatchBar({super.key});

  @override
  State<SingleDispatchBar> createState() => _SingleDispatchBarState();
}

class _SingleDispatchBarState extends State<SingleDispatchBar> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedAppId;
  late Future<List<String>?> _books;

  // @override
  // initState() {
  //   super.initState();
  //   _books = context.read<BookProvider>().books;
  // }

  bool validate() {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }

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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: 60,
                child: Text(
                  'Добавить книгу',
                  style: style.copyWith(
                      fontWeight: FontWeight.w400, fontSize: 25, color: colorScheme.onSurface.withOpacity(0.7)),
                ),
              ),
              TextFormField(
                controller: context.read<BookFieldsProvider>().bookNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Название книги',
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty || value == '') {
                    return 'Обязательное поле';
                  }
                  if (value == '' && value.length > 20) {
                    return 'Максимум 20 символов';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: context.read<BookFieldsProvider>().bookTitleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Заголовок',
                ),
                onChanged: (String? value) {},
                validator: (String? value) {
                  if (value != '' && value!.length > 30) {
                    return 'Максимум 30 символов';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: context.read<BookFieldsProvider>().bookAuthorController,
                maxLines: 20,
                minLines: 1,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Автор',
                ),
                onChanged: (String? value) {},
                validator: (String? value) {
                  if (value == null || value.isEmpty || value == '') {
                    return 'Обязательное поле';
                  }
                  if (value != '' && value.length > 30) {
                    return 'Максимум 30 символов';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              TextFormField(
                controller: context.read<BookFieldsProvider>().bookDescriptionController,
                keyboardType: TextInputType.url,
                maxLines: 20,
                minLines: 1,
                obscureText: false,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Описание',
                ),
                onChanged: (String? value) {},
                validator: (String? value) {
                  if (value != '' && value!.length > 512) {
                    return 'Максимум 512 символов';
                  }
                  return null;
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Tooltip(
                message: 'Стоимость книги',
                child: TextFormField(
                  controller: context.read<BookFieldsProvider>().bookPriceController,
                  keyboardType: TextInputType.url,
                  maxLines: 20,
                  minLines: 1,
                  obscureText: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Стоимость книги',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Обязательное поле';
                    }
                    if (value != '' && !isInt(value)) {
                      return 'Нужно целое число';
                    }
                    if (int.parse(value) > 99999) {
                      return 'Слишком большое значение';
                    }
                    return null;
                  },
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints.tightFor(width: 110, height: 50),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        maximumSize: const Size(70, 40),
                      ),
                      onPressed: () async {
                        bool valid = validate();
                        if (valid) {
                          UIBlock.block(context);

                          if (context.read<BookFieldsProvider>().method == 'POST') {
                            await context.read<BookProvider>().createBook(BookRequest(
                                  name: context.read<BookFieldsProvider>().bookNameController.text,
                                  title: context.read<BookFieldsProvider>().bookTitleController.text,
                                  author: context.read<BookFieldsProvider>().bookAuthorController.text,
                                  description: context.read<BookFieldsProvider>().bookDescriptionController.text,
                                  price: int.parse(context.read<BookFieldsProvider>().bookPriceController.text),
                                ));
                          }
                          if (!mounted) return;
                          if (context.read<BookFieldsProvider>().method == 'UPDATE') {
                            await context.read<BookProvider>().updateBook(
                                context.read<BookFieldsProvider>().bookId,
                                BookRequest(
                                  name: context.read<BookFieldsProvider>().bookNameController.text,
                                  title: context.read<BookFieldsProvider>().bookTitleController.text,
                                  author: context.read<BookFieldsProvider>().bookAuthorController.text,
                                  description: context.read<BookFieldsProvider>().bookDescriptionController.text,
                                  price: int.parse(context.read<BookFieldsProvider>().bookPriceController.text),
                                ));
                          }
                          if (!mounted) return;
                          context.read<BookFieldsProvider>().resetProvider();
                          UIBlock.unblock(context);
                          showFlashBar(context, colorScheme, style);
                        }
                      },
                      child: Text(context.watch<BookFieldsProvider>().method == 'POST' ? 'Создать' : 'Обновить'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
