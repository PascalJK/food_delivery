// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'Jokies Foodies';
  static const int APP_Version = 1;

  static const String TOKEN = 'DBtonken';

  // SharedPrefs Key
  static const String CART_LIST = 'cart-list';
  static const String CART_HISTORY_LIST = 'cart-history-list';

// Local Server Endpoint
// Helpful Link : https://dev.to/ljnce/test-your-laravel-project-easily-with-phone-2l46#:~:text=Go%20to%20your%20Laravel%20application%20project%20-%3E%20open,your%20Laravel%20project%20on%20you%20mobile%20phone%20browser%21

  // static const String BASE_URL = 'https://mvs.bslmeiyu.com';
  static const String BASE_URL = 'http://192.168.43.252:8080';

  static const String REGISTRATION_URI = '/api/v1/auth/register';
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URI = '/api/v1/products/recommended';

  static const String UPLOAD_URL = '$BASE_URL/uploads/';
}
