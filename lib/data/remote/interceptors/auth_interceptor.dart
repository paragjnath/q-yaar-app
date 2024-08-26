import 'package:dio/dio.dart';
import 'package:q_yaar/data/redux/auth/auth_actions.dart';
import 'package:q_yaar/data/redux/store.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    final token = store.state.authState.authData?.profiles?.player?.accessToken;
    if (token != null) {
      final jwt = "JWT $token";
      options.headers['Authorization'] = jwt;
    }
    super.onRequest(options, handler);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    if (err.response?.statusCode == 401) {
      store.dispatch(LogoutAction());
    }
    super.onError(err, handler);
  }
}
