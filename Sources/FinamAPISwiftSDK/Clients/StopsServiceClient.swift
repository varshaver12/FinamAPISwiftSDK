import GRPC

internal struct StopsServiceClient: Grpc_Tradeapi_V1_StopsClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Grpc_Tradeapi_V1_StopsClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: StopsServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = StopsServiceClientInterceptorFactory()
    }
}
