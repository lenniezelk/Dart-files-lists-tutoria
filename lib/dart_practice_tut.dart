import 'dart:convert';
import 'dart:io';

void makeJson() {
  final data = File('net_income.txt').readAsStringSync();
  final items = data.split(
      '|'); // ['Aventura', '  97,452 ', '5677', 'Boca Raton', '63738', '63738]
  final d = {};
  var currList = [];

  items.asMap().forEach((index, item) {
    final processedItem = item.trim().replaceAll(',', '');
    if (index % 57 == 0) {
      currList = [];
      d[processedItem] = currList;
    } else {
      currList.add(processedItem);
    }
  });

  // d = {"Aventura": ['67272', '373883'], "Boca Raton": ['73893', '73783']}
  final json = jsonEncode(d);
  final jsonFile = File('net_income.json');
  jsonFile.writeAsStringSync(json);
}
