#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol OrdersServiceAsyncClient: Grpc_Tradeapi_V1_OrdersAsyncClientProtocol {}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension OrdersServiceClient: OrdersServiceAsyncClient {}
#endif
