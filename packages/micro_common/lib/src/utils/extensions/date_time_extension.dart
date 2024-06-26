import 'package:micro_dependencies/micro_dependencies.dart';

extension DateTimeFormatterString on String {
  DateTime? get toDateTime {
    return DateTime.tryParse(this);
  }
}

extension DateTimeFormatter on DateTime {
  String get ddMMyyy {
    return DateFormat('dd/MM/yyyy').format(this);
  }

  String get dayMonthYear {
    return DateFormat(
      "dd 'de' MMMM 'de' yyyy",
      'pt_BR',
    ).format(this);
  }

  String get yyyy {
    return DateFormat('yyyy').format(this);
  }

  String get age {
    final DateTime now = DateTime.now();
    final Duration age = now.difference(this);
    final years = age.inDays ~/ 365;
    return '$years';
  }
}
