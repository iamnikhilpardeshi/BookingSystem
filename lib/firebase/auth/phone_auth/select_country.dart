import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:VisitorsManagementSystem/data_models/country.dart';
import 'package:VisitorsManagementSystem/providers/countries.dart';
import 'package:VisitorsManagementSystem/utils/widgets.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countriesProvider = Provider.of<CountryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Search your country',
            style: TextStyle(color: Colors.black54)),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 50.0),
          child:
              SearchCountryTF(controller: countriesProvider.searchController),
        ),
      ),
      body: ListView.builder(
        itemCount: countriesProvider.searchResults.length,
        itemBuilder: (BuildContext context, int i) {
          return SelectableWidget(
            country: countriesProvider.searchResults[i],
            selectThisCountry: (Country c) {
              print(i);
              countriesProvider.selectedCountry = c;
              Navigator.of(context).pop();
            },
          );
        },
      ),
    );
  }
}
