// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:intl/intl.dart';
import 'package:muvver_app/modules/core/error/log_error.dart';

class DatetimeUtil {
  static const String FORMAT_DATE_BD = "yyyy-MM-dd";
  static const String FORMAT_DATE_TIME_BD = "yyyy-MM-dd hh:mm:ss";
  static const String FORMATO_DATE = "dd/MM/yyyy";
  static const String FORMAT_DATE_TIME = "dd/MM/yyyy HH:mm:ss";

  static final DATETIME_INVALIDATE = DateTime(1980, 01, 01);

  static String getStringFromDateTime(String data) {
    List<String> calendario = data.replaceAll(RegExp("[/-]"), " ").split(" ");
    String dia = calendario[0];
    String mes = calendario[1];
    String ano = calendario[2];
    String hora = calendario[3];

    String datahora = "$ano-$mes-$dia $hora";

    return datahora.toString();
  }

  static String getStringFromDate(DateTime? date) {
    String dateString;
    try {
      dateString = DateFormat(FORMATO_DATE).format(date!);
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
      dateString = "";
    }
    return dateString;
  }

  static DateTime strToDate(String data) {
    try {
      if (data.contains('.')) {
        data = data.split(".")[0];
      }

      DateFormat formatter = DateFormat(FORMATO_DATE);
      DateTime date = formatter.parse(data);
      return date;
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
      return DATETIME_INVALIDATE;
    }
  }

  static DateTime getDate(String dbDate, String format) {
    try {
      DateFormat dateFormat = DateFormat(format);
      DateTime data = dateFormat.parse(dbDate);

      return data;
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
      return DATETIME_INVALIDATE;
    }
  }

  static String getMonthYear(DateTime date) {
    try {
      return "${_months[date.month]}/${date.year.toString()}";
    } catch (exception, stackTrace) {
      LogError(exception, stackTrace);
      return "DATETIME_INVALIDATE";
    }
  }

  static const _months = {
    1: "Janeiro",
    2: "Fevereiro",
    3: "Março",
    4: "Abril",
    5: "Maio",
    6: "Junho",
    7: "Julho",
    8: "Agosto",
    9: "Setembro",
    10: "Outubro",
    11: "Novembro",
    12: "Dezembro",
  };
}
