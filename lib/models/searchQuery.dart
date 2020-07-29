import 'package:flutter/cupertino.dart';

//TODO: Incomplete functionality
class SearchQuery with ChangeNotifier {
  String textquery;

  String get _textquery {
    return _textquery;
  }

  void updateTextQuery(String newQuery) {
    textquery = newQuery;
    print("${textquery} updated");
    notifyListeners();
  }
}