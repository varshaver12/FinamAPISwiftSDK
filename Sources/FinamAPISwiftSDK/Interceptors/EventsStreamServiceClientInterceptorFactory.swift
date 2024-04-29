import GRPC

internal struct EventsStreamServiceClientInterceptorFactory:
    Grpc_Tradeapi_V1_EventsClientInterceptorFactoryProtocol {
    
    func makeGetEventsInterceptors() -> [GRPC.ClientInterceptor<Proto_Tradeapi_V1_SubscriptionRequest, Proto_Tradeapi_V1_Event>] {
        return []
    }
    
}
