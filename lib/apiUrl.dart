



import 'networkManager.dart';
const apikey = 'AB030FA5-6D1B-44A0-9DD7-A39FB1A3AEC7';
const countryName ='USD';

class ApiData{

  Future<dynamic> getBitCoinData(String selectedCurrency) async {
    NetworkManager networkManager = NetworkManager(
      url:Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=AB030FA5-6D1B-44A0-9DD7-A39FB1A3AEC7'),
    );
    var coinData = await networkManager.getData();
    return coinData;
  }

  Future<dynamic> getLiteCoin(String selectedCurrency) async {
    NetworkManager networkManager = NetworkManager(
      url:Uri.parse('https://rest.coinapi.io/v1/exchangerate/LTC/$selectedCurrency?apikey=AB030FA5-6D1B-44A0-9DD7-A39FB1A3AEC7'),
    );
    var coinData = await networkManager.getData();
    return coinData;
  }

  Future<dynamic> getEtherumCoin(String selectedCurrency) async {
    NetworkManager networkManager = NetworkManager(
      url:Uri.parse('https://rest.coinapi.io/v1/exchangerate/ETC/$selectedCurrency?apikey=AB030FA5-6D1B-44A0-9DD7-A39FB1A3AEC7'),
    );
    var coinData = await networkManager.getData();
    return coinData;
  }
}