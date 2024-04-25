import NIOCore
import Foundation

public protocol SecuritiesService {

    func getSecurities(
        board: String?,
        seccode: String?
    ) throws -> EventLoopFuture<[Security]>
    
    
#if compiler(>=5.5) && canImport(_Concurrency)

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getSecurities(
        board: String?,
        seccode: String?
    ) async throws -> [Security]

#endif
}

internal struct GrpcSecuritiesService: SecuritiesService {
    let client: SecuritiesServiceClient
    
    init(_ client: SecuritiesServiceClient) {
        self.client = client
    }
    
    func getSecurities(
        board: String?,
        seccode: String?
    ) throws -> EventLoopFuture<[Security]> {
        self.client
            .getSecurities( try .new(board: board, seccode: seccode))
            .response
            .flatMapThrowing {
                try $0.securities.map { try $0.toModel() }
            }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getSecurities(
        board: String?,
        seccode: String?
    ) async throws -> [Security] {
        try await self.client
            .getSecurities(try .new(board: board, seccode: seccode))
            .securities
            .map { try $0.toModel() }
    }
    
#endif
}
