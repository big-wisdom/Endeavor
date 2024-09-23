import 'package:grpc/grpc.dart';

class AuthInterceptor extends ClientInterceptor {
  final String authToken;

  AuthInterceptor(this.authToken);

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
    ClientMethod<Q, R> method,
    Q request,
    CallOptions options,
    invoker,
  ) {
    final updatedOptions = options.mergedWith(
      CallOptions(metadata: {'authorization': 'Bearer $authToken'}),
    );
    return invoker(method, request, updatedOptions);
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
    ClientMethod<Q, R> method,
    Stream<Q> requests,
    CallOptions options,
    invoker,
  ) {
    final updatedOptions = options.mergedWith(
      CallOptions(metadata: {'authorization': 'Bearer $authToken'}),
    );
    return invoker(method, requests, updatedOptions);
  }
}
