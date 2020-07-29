import 'package:ecommerce/models/searchQuery.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {
    //Get data from Provider
    var searchqueryModel = Provider.of<SearchQuery>(context);

    return Center(
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          Expanded(
            child: TextField(
              onChanged: (String value) {
                searchqueryModel.updateTextQuery(value);
              },
            ),
          )
        ],
      ),
    );
  }
}
