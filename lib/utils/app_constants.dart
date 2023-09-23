// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = 'Jokies Foodies';
  static const int APP_Version = 1;

  static const String TOKEN = 'DBtonken';

  // SharedPrefs Key
  static const String CART_LIST = 'cart-list';
  static const String CART_HISTORY_LIST = 'cart-history-list';

// Local Server Endpoint
  // static const String BASE_URL = 'https://127.0.0.1:8000';

  static const String BASE_URL = 'https://mvs.bslmeiyu.com';
  static const String REGISTRATION_URI = '/api/v1/auth/register';
  static const String POPULAR_PRODUCT_URI = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URI = '/api/v1/products/recommended';

  static const String UPLOAD_URL = '$BASE_URL/uploads/';
}
