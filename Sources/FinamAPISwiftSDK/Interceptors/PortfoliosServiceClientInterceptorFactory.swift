import GRPC

internal struct PortfoliosServiceClientInterceptorFactory:
    Grpc_Tradeapi_V1_PortfoliosClientInterceptorFactoryProtocol {
    
    func makeGetPortfolioInterceptors() -> [GRPC.ClientInterceptor<Proto_Tradeapi_V1_GetPortfolioRequest, Proto_Tradeapi_V1_GetPortfolioResult>] {
        return []
    }
    
}
