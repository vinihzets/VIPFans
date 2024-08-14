import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:only_fans/core/architecture/failure.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_html/html.dart' as html;

// ignore: avoid_web_libraries_in_flutter

class CsvHelper {
  static String nullToEmptyString(value) {
    return value == null ? "" : value.toString();
  }

  static String buildDetailedInvoiceLine(Map responseData) {
    String result = "";

    for (int i = 0; i < responseData['data'].length; i++) {
      result += '"${nullToEmptyString(responseData['data'][i]["descricao"])}";';

      // A adição das aspas extras e "=" serve para que o MS Excel reconheça o dado como texto
      // ao invés de número, que sendo de grandeza muito alto, será convertido para
      // notação científica.
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["iccid"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["numero"])}""";';
      result += '"${nullToEmptyString(responseData['data'][i]["operadora"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["valor_cobrado"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["valor_negociado"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["valor_multa"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["status_chip"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["numero_pedido"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["data_pedido"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["data_ativacao"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["data_faturamento"])}";';
      result +=
          '"${nullToEmptyString(responseData['data'][i]["dias_utilizados"])}";';
      result += '"${nullToEmptyString(responseData['data'][i]["consumo"])}"\n';
    }

    return result;
  }

  static buildM2mInventoryLine(Map responseData) {
    String result = "";

    for (int i = 0; i < responseData['data'].length; i++) {
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["campoLivre"])}""";';

      // A adição das aspas extras e "=" serve para que o MS Excel reconheça o dado como texto
      // ao invés de número, que sendo de grandeza muito alto, será convertido para
      // notação científica.
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["iccid"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["numero"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["operadoraChip"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["statusChip"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["dataSessao"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["imeiChip"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["ipChip"])}""";';
      result +=
          '"=""${nullToEmptyString(responseData['data'][i]["consumoChip"])}""";\n';
      // result +=
      //     '"${nullToEmptyString(responseData['data'][i]["data_pedido"])}";';
      // result +=
      //     '"${nullToEmptyString(responseData['data'][i]["data_ativacao"])}";';
      // result +=
      //     '"${nullToEmptyString(responseData['data'][i]["data_faturamento"])}";';
      // result +=
      //     '"${nullToEmptyString(responseData['data'][i]["dias_utilizados"])}";';
      // result += '"${nullToEmptyString(responseData['data'][i]["consumo"])}"\n';
    }

    return result;
  }

  static void downloadCSV(String csv, String? name) async {
    if (kIsWeb) {
      final bytes = utf8.encode(csv);
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.AnchorElement(href: url)
        ..setAttribute("download", "$name-${DateTime.now()}.csv")
        ..click();
      html.Url.revokeObjectUrl(url);
    } else {
      var status = await Permission.storage.request();

      if (status.isGranted) {
        final directory = await getExternalStorageDirectory();
        if (directory != null) {
          final path = directory.path;
          final filePath =
              '$path/$name-${DateTime.now().toIso8601String()}.csv';

          final file = File(filePath);
          await file.writeAsString(csv, encoding: utf8);

          return;
        } else {
          throw RemoteFailure(
              message: 'Não foi possível obter o diretório de armazenamento');
        }
      } else {
        throw RemoteFailure(message: 'Permissão de armazenamento negada');
      }
    }
  }

  static void downloadPDF(Uint8List pdf, String? name) async {
    if (kIsWeb) {
      final blob = html.Blob([pdf]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'NFSe-$name-${DateTime.now()}.pdf';

      html.document.body?.children.add(anchor);
      anchor.click();
      html.document.body?.children.remove(anchor);

      html.Url.revokeObjectUrl(url);
    } else {
      var status = await Permission.storage.request();

      if (status.isGranted) {
        final directory = await getExternalStorageDirectory();
        if (directory != null) {
          final path = directory.path;
          final filePath =
              'NFSe-$path/$name-${DateTime.now().toIso8601String()}.pdf';

          final file = File(filePath);
          await file.writeAsString('pdf', encoding: utf8);

          return;
        } else {
          throw RemoteFailure(
              message: 'Não foi possível obter o diretório de armazenamento');
        }
      } else {
        throw RemoteFailure(message: 'Permissão de armazenamento negada');
      }
    }
  }
}
