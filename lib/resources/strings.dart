import 'package:intl/intl.dart';

class CustomStrings {
  static const String searchResults = 'Результат поиска';
  static const String defaultErrorMessage = 'При загрузке произошла ошибка';
  static const String search = 'Поиск';
  static const String find = 'Найти';
  static const String nothingsFound = 'Ничего не найдено';
  static String found(int x) => 'Найдено: $x';
  static const String updated = 'Обновлено: ';
  static String updatedAt(DateTime? date) {
    if (date == null) {
      return CustomStrings.unknown;
    }
    if (DateTime.now().year == date.year) {
      final dateFormatter = DateFormat('d MMMM', 'ru_RU');
      return dateFormatter.format(date);
    } else {
      final dateFormatter = DateFormat('dd.MM.yyyy', 'ru_RU');
      return dateFormatter.format(date);
    }
  }

  static const String unknown = 'Неизвестно';
  static const String retry = 'Повторить';
  static const String resultsLoading = 'Загружаются результаты поиска';
  static const String forQuery = 'По запросу: ';
}
