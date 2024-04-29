import GRPC

internal struct EventsStreamServiceClient: Grpc_Tradeapi_V1_EventsClientProtocol {
    let channel: GRPCChannel
    var defaultCallOptions: CallOptions
    var interceptors: Grpc_Tradeapi_V1_EventsClientInterceptorFactoryProtocol? {
        get {
            return interceptorFactory
        }
    }
    
    private let interceptorFactory: EventsStreamServiceClientInterceptorFactory

    init(
      channel: GRPCChannel,
      defaultCallOptions: CallOptions
    ) {
        self.channel = channel
        self.defaultCallOptions = defaultCallOptions
        self.interceptorFactory = EventsStreamServiceClientInterceptorFactory()
    }
}
