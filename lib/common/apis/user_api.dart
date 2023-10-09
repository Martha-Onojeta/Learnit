import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/utils/http_utils.dart';

class UserAPI {
  static login({LoginRequestEntity? param}) async {
    var response =
        await HttpUtil().post('api/login', queryParameter: param?.toJson());

    return UserLoginResponseEntity.fromJson(response);
  }
}
