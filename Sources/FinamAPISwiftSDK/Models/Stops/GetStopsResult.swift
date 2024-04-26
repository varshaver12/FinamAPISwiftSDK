import Foundation

/// Информация о биржевой заявке.
public protocol GetStopsResult {
    /// Trade Account Id.
    /// Идентификатор торгового счёта.
    var clientID: String { get }

    /// Stop Orders List.
    /// Список стоп-заявок.
    var stops: [Stop] { get }
}

internal struct GetStopsResultModel: GetStopsResult {
    var clientID: String
    
    var stops: [Stop]
    
}

internal extension GetStopsResultModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_GetStopsResult) throws {
        self.clientID = grpcModel.clientID
        self.stops = try grpcModel.stops.map { try $0.toModel() }
    }
}


internal extension Proto_Tradeapi_V1_GetStopsResult {
    func toModel() throws -> GetStopsResultModel {
        try GetStopsResultModel(grpcModel: self)
    }
}
