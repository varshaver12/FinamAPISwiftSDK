import GRPC

internal struct PortfoliosServiceClient: Grpc_Tradeapi_V1_PortfoliosClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Grpc_Tradeapi_V1_PortfoliosClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: PortfoliosServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = PortfoliosServiceClientInterceptorFactory()
    }
}
