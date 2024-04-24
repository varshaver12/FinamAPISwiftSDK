import GRPC

internal struct OrdersServiceClientInterceptorFactory:
    Grpc_Tradeapi_V1_OrdersClientInterceptorFactoryProtocol {
    func makeNewOrderInterceptors() -> [ClientInterceptor<Proto_Tradeapi_V1_NewOrderRequest, Proto_Tradeapi_V1_NewOrderResult>] {
        return []
    }
    
    func makeCancelOrderInterceptors() -> [ClientInterceptor<Proto_Tradeapi_V1_CancelOrderRequest, Proto_Tradeapi_V1_CancelOrderResult>] {
        return []
    }
    
    func makeGetOrdersInterceptors() -> [ClientInterceptor<Proto_Tradeapi_V1_GetOrdersRequest, Proto_Tradeapi_V1_GetOrdersResult>] {
        return []
    }
    
}
