import NIOCore
import Foundation

public protocol PortfoliosService {

    func getPortfolios(
        clientID: String,
        content: PortfolioContent?
    ) throws -> EventLoopFuture<GetPortfolioResult>
    
    
#if compiler(>=5.5) && canImport(_Concurrency)

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getPortfolios(
        clientID: String,
        content: PortfolioContent?
    ) async throws -> GetPortfolioResult

#endif
}

internal struct GrpcPortfoliosService: PortfoliosService {
    let client: PortfoliosServiceClient
    
    init(_ client: PortfoliosServiceClient) {
        self.client = client
    }
    
    func getPortfolios(
        clientID: String,
        content: PortfolioContent?
    ) throws -> EventLoopFuture<GetPortfolioResult> {
        self.client
            .getPortfolio( try .new(clientID: clientID, content: content))
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getPortfolios(
        clientID: String,
        content: PortfolioContent?
    ) async throws -> GetPortfolioResult{
        try await self.client
            .getPortfolio( try .new(clientID: clientID, content: content))
            .toModel()
    }
    
#endif
}
