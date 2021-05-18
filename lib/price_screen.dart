import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'apiUrl.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  ApiData apiData = ApiData();

  double rate;

  void initState() {
    super.initState();
    getBitCoinData();
    getEnerumCoinData();
    getliteCoinData();
  }

  String selectedCurrency = 'USD';

  DropdownButton<String> getDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems =
        []; //inside list it is string

    // for (int i = 0; i < currenciesList.length; i++) {
    //String currency = currenciesList[i];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    // return dropDownItems;
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        print(selectedCurrency);
      },
    );
  }

  //for IOS

  CupertinoPicker iosPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(
        Text(currency),
      );
    }
    //return pickerItems;
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  //send the selected currency to the apiUrl
  String bitCoinValue = '?';
  String liteCoinValue = '?';
  String etherumCoinValue = '?';

  void getBitCoinData() async {
    try {
      //We're now passing the selectedCurrency when we call getCoinData().
      var data = await apiData.getBitCoinData(selectedCurrency);
      setState(() {
        bitCoinValue = data;
      });
      print(data);
    } catch (e) {
      print(e);
    }
  }

  void getliteCoinData() async {
    try {
      //We're now passing the selectedCurrency when we call getCoinData().
      var data = await apiData.getLiteCoin(selectedCurrency);
      setState(() {
        liteCoinValue = data;
      });
      print(data);
    } catch (e) {
      print(e);
    }
  }

  void getEnerumCoinData() async {
    try {
      //We're now passing the selectedCurrency when we call getCoinData().
      var data = await apiData.getEtherumCoin(selectedCurrency);
      setState(() {
        etherumCoinValue = data;
      });
      print(data);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Column(
              children: [
                ResuableCard(
                  coinValue: bitCoinValue,
                  selectedCurrency: selectedCurrency,
                  currency: 'BTC',
                ),
                ResuableCard(
                  coinValue: liteCoinValue,
                  selectedCurrency: selectedCurrency,
                  currency: 'LTC'
                ),
                ResuableCard(
                  coinValue: etherumCoinValue,
                  selectedCurrency: selectedCurrency,
                  currency: 'ETC',
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iosPicker() : getDropDownButton(),
          ),
        ],
      ),
    );
  }
}

class ResuableCard extends StatelessWidget {
  const ResuableCard({
    @required this.coinValue,
    @required this.selectedCurrency,
    @required this.currency,
  });

  final String coinValue;
  final String selectedCurrency;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
        child: Text(
          //5: Update the currency name depending on the selectedCurrency.
          '1 $currency = $coinValue $selectedCurrency',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
