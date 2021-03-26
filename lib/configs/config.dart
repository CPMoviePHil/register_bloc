class Config{

  static final Config _instance = Config._internal();

  factory Config(){
    return _instance;
  }

  Config._internal();

  static final String http = 'http://';
  static final String mainDomain = 'ilolly.shoesconn.com';
  static final String connectPort = ':7031/';
  static final String apiPath = 'api/';

  static final String domain = http + mainDomain + connectPort;
  static final String api = http + mainDomain + connectPort + apiPath;

  static final String version = '1.0.0';
}