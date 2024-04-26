import NIOCore
import Foundation

public protocol StopsService {

    func getStops(
        clientID: String,
        includeExecuted: Bool,
        includeCanceled: Bool,
        includeActive: Bool
    ) throws -> EventLoopFuture<GetStopsResult>

#if compiler(>=5.5) && canImport(_Concurrency)

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getStops(
        clientID: String,
        includeExecuted: Bool,
        includeCanceled: Bool,
        includeActive: Bool
    ) async throws -> GetStopsResult

#endif
}

internal struct GrpcStopsService: StopsService {
    let client: StopsServiceClient
    
    init(_ client: StopsServiceClient) {
        self.client = client
    }
    
    func getStops(clientID: String, includeExecuted: Bool, includeCanceled: Bool, includeActive: Bool) throws -> EventLoopFuture<GetStopsResult> {
        self.client
            .getStops( try .new(clientID: clientID,
                                includeExecuted: includeExecuted,
                                includeCanceled: includeCanceled,
                                includeActive: includeActive))
            .response
            .flatMapThrowing { try $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func getStops(clientID: String, includeExecuted: Bool, includeCanceled: Bool, includeActive: Bool) async throws -> GetStopsResult {
        try await self.client
            .getStops( try .new(clientID: clientID,
                                includeExecuted: includeExecuted,
                                includeCanceled: includeCanceled,
                                includeActive: includeActive))
            .toModel()
    }
    
#endif
}
