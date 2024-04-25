#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol SecuritiesServiceAsyncClient: Grpc_Tradeapi_V1_SecuritiesAsyncClientProtocol {}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension SecuritiesServiceClient: SecuritiesServiceAsyncClient {}
#endif
