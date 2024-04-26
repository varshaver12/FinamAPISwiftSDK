import GRPC

internal struct StopsServiceClientInterceptorFactory:
    Grpc_Tradeapi_V1_StopsClientInterceptorFactoryProtocol {
    func makeGetStopsInterceptors() -> [ClientInterceptor<Proto_Tradeapi_V1_GetStopsRequest, Proto_Tradeapi_V1_GetStopsResult>] {
        return []
    }
    
    func makeCancelStopInterceptors() -> [ClientInterceptor<Proto_Tradeapi_V1_CancelStopRequest, Proto_Tradeapi_V1_CancelStopResult>] {
        return []
    }
    
    func makeNewStopInterceptors() -> [ClientInterceptor<Proto_Tradeapi_V1_NewStopRequest, Proto_Tradeapi_V1_NewStopResult>] {
        return []
    }
    
}
