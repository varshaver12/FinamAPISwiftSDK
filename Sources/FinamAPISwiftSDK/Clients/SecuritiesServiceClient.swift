import GRPC

internal struct SecuritiesServiceClient: Grpc_Tradeapi_V1_SecuritiesClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Grpc_Tradeapi_V1_SecuritiesClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: SecuritiesServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = SecuritiesServiceClientInterceptorFactory()
    }
}
