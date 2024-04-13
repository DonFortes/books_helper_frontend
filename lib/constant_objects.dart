const int mobileWidth = 1050;
const int desktopWidth = 1;
const double leftBarWidth = 160.0;
const double bookAddingBarWidth = 250.0;
const double selectorColumnsWidth = 250.0;

Map<int, String> barOrderMap = <int, String>{
  0: 'books-page',
  1: 'logout',
  2: 'login',
};

Map<String, String> routeMap = <String, String>{
  'books-page': '/books-page',
  'logout': '/logout',
  'login': '/login',
};

Map<String, String> routeLabelMap = <String, String>{
  'books-page': 'Книги',
  'logout': 'Выход',
  'login': 'Вход',
};
