#if compiler(>=5.5) && canImport(_Concurrency)
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol PortfoliosServiceAsyncClient: Grpc_Tradeapi_V1_PortfoliosAsyncClientProtocol {}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension PortfoliosServiceClient: PortfoliosServiceAsyncClient {}
#endif
