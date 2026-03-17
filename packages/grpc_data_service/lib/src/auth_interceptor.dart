import 'package:grpc/grpc.dart';

class AuthInterceptor extends ClientInterceptor {
  String _authToken;
  final Future<String> Function() _onRefresh;

  AuthInterceptor(this._authToken, this._onRefresh);

  CallOptions _buildOptions(CallOptions options) => options.mergedWith(
        CallOptions(metadata: {'authorization': 'Bearer $_authToken'}),
      );

  void _refreshOnAuthError(Object error) {
    if (error is GrpcError && error.code == StatusCode.unauthenticated) {
      _onRefresh().then((token) {
        if (token.isNotEmpty) _authToken = token;
      });
    }
  }

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    invoker,
  ) {
    final response = invoker(method, request, _buildOptions(options));
    response.then((_) {}, onError: _refreshOnAuthError);
    return response;
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    invoker,
  ) {
    final response = invoker(method, requests, _buildOptions(options));
    response.listen((_) {}, onError: _refreshOnAuthError);
    return response;
  }
}
