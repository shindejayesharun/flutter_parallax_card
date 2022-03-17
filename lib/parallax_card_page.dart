import 'package:flutter/material.dart';
import 'package:parallax_card/data.dart';
import 'package:parallax_card/styles.dart';
import 'package:parallax_card/travel_card_list_view.dart';

import 'hotel_list.dart';

class ParallexCardPage extends StatefulWidget {
  const ParallexCardPage({Key? key}) : super(key: key);

  @override
  State<ParallexCardPage> createState() => _ParallexCardPageState();
}

class _ParallexCardPageState extends State<ParallexCardPage> {
  late List<City> _cityList;
  late City _currentCity;

  @override
  void initState() {
    super.initState();
    var data = DemoData();
    setState(() {
      _cityList = data.getCities();
      _currentCity = _cityList[1];
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
              child: Text(
                'Where are you going next?',
                overflow: TextOverflow.ellipsis,
                style: Styles.appHeader,
                maxLines: 2,
              ),
            ),
            TravelCardList(
              cities: _cityList,
              onCityChange: _handleCityChange,
            ),
            // Container(
            //   height: size.height * .25,
            // ),
            HotelList(_currentCity.hotels!),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }

  void _handleCityChange(City city) {
    setState(() {
      this._currentCity = city;
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: Icon(Icons.menu, color: Colors.black),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      actions: <Widget>[
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
          child: Icon(Icons.search, color: Colors.black),
        )
      ],
    );
  }
}
