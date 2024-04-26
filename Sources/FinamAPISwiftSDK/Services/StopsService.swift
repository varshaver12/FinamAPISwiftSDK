import NIOCore
import Foundation

public protocol StopsService {

    func getStops(
        clientID: String,
        includeExecuted: Bool,
        includeCanceled: Bool,
        includeActive: Bool
    ) throws -> EventLoopFuture<GetStopsResult>
    
    func cancelStop(
        clientID: String,
        stopID: Int32
    ) throws -> EventLoopFuture<CancelStopResult>
    
    func newStop(
        clientID: String,
        securityBoard: String,
        securityCode: String,
        buySell: BuySell,
        stopLoss: StopLoss?,
        takeProfit: TakeProfit?,
        expirationDate: Date?,
        linkOrder: Int64,
        validBefore: OrderValidBefore?
    ) throws -> EventLoopFuture<NewStopResult>

#if compiler(>=5.5) && canImport(_Concurrency)

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getStops(
        clientID: String,
        includeExecuted: Bool,
        includeCanceled: Bool,
        includeActive: Bool
    ) async throws -> GetStopsResult
    
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func cancelStop(
        clientID: String,
        stopID: Int32
    ) async throws -> CancelStopResult
    
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func newStop(
        clientID: String,
        securityBoard: String,
        securityCode: String,
        buySell: BuySell,
        stopLoss: StopLoss?,
        takeProfit: TakeProfit?,
        expirationDate: Date?,
        linkOrder: Int64,
        validBefore: OrderValidBefore?
    ) async throws -> NewStopResult

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
    
    func cancelStop(clientID: String, stopID: Int32) throws -> EventLoopFuture<CancelStopResult> {
        self.client
            .cancelStop( try .new(clientID: clientID, stopID: stopID) )
            .response
            .map { $0.toModel() }
    }
    
    func newStop(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, stopLoss: StopLoss?, takeProfit: TakeProfit?, expirationDate: Date?, linkOrder: Int64, validBefore: OrderValidBefore?) throws -> EventLoopFuture<NewStopResult> {
        self.client
            .newStop( try .new(clientID: clientID,
                               securityBoard: securityBoard,
                               securityCode: securityCode,
                               buySell: buySell,
                               stopLoss: stopLoss,
                               takeProfit: takeProfit,
                               expirationDate: expirationDate,
                               linkOrder: linkOrder,
                               validBefore: validBefore))
            .response
            .map { $0.toModel() }
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
    
    func cancelStop(clientID: String, stopID: Int32) async throws -> CancelStopResult {
        try await self.client
            .cancelStop( try .new(clientID: clientID, stopID: stopID))
            .toModel()
    }
    
    func newStop(clientID: String, securityBoard: String, securityCode: String, buySell: BuySell, stopLoss: StopLoss?, takeProfit: TakeProfit?, expirationDate: Date?, linkOrder: Int64, validBefore: OrderValidBefore?) async throws -> NewStopResult {
        try await self.client
            .newStop( try .new(clientID: clientID,
                                securityBoard: securityBoard,
                                securityCode: securityCode,
                                buySell: buySell,
                                stopLoss: stopLoss,
                                takeProfit: takeProfit,
                                expirationDate: expirationDate,
                                linkOrder: linkOrder,
                                validBefore: validBefore))
            .toModel()
    }
    
#endif
}
