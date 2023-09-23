class ResponseModel {
  final bool _isSuccess;
  final String _message;

  ResponseModel(this._isSuccess, this._message);

  String get getMessage => _message;

  bool get getSuccess => _isSuccess;
}
