import Foundation

/// Информация о биржевой заявке.
public protocol GetOrdersResult {
    /// Trade Account Id.
    /// Идентификатор торгового счёта.
    var clientID: String { get }

    /// Orders list.
    /// Список заявок.
    var orders: [Order] { get }
}

internal struct GetOrdersResultModel: GetOrdersResult {
    var clientID: String
    
    var orders: [Order]
    
}

internal extension GetOrdersResultModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_GetOrdersResult) throws {
        self.clientID = grpcModel.clientID
        self.orders = try grpcModel.orders.map { try $0.toModel() }
    }
}


internal extension Proto_Tradeapi_V1_GetOrdersResult {
    func toModel() throws -> GetOrdersResultModel {
        try GetOrdersResultModel(grpcModel: self)
    }
}
