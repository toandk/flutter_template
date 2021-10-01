import 'package:flutter_template/models/gpuser.dart';
import 'package:flutter_template/models/notification/notification_model.dart';

mixin GPParserJson {
  static Map<Type, Function> _mapFactories<T>() {
    return <Type, Function>{
      T: (Map<String, dynamic> x) => _mapFactoryValue<T>(x),
    };
  }

  static dynamic _mapFactoryValue<T>(Map<String, dynamic> x) {
    // parse all items here
    switch (T) {
      case NotificationModel:
        return NotificationModel.fromJson(x);
      default:
        throw Exception("ApiResponseExtension _mapFactoryValue error!!!");
    }
  }

  static T parseJson<T>(Map<String, dynamic> x) {
    Map<Type, Function> _factories = _mapFactories<T>();
    return _factories[T]?.call(x);
  }
}
