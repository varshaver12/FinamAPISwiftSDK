import GRPC

internal struct SecuritiesServiceClientInterceptorFactory:
    Grpc_Tradeapi_V1_SecuritiesClientInterceptorFactoryProtocol {
    func makeGetSecuritiesInterceptors() -> [GRPC.ClientInterceptor<Grpc_Tradeapi_V1_GetSecuritiesRequest, Grpc_Tradeapi_V1_GetSecuritiesResult>] {
        return []
    }
    
}
