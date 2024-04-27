#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol StopsServiceAsyncClient: Grpc_Tradeapi_V1_StopsAsyncClientProtocol {}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension StopsServiceClient: StopsServiceAsyncClient {}
#endif
