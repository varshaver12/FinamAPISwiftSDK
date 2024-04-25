import Foundation

/// Информация о биржевой заявке.
public protocol CancelOrderResult {
    /// Trade Account Id.
    /// Идентификатор торгового счёта.
    var clientID: String { get }
    
    /// Transaction Id, which can be used to cancel order or find corresponding order_no in Event service.
    /// Идентификатор транзакции, который может быть использован для отмены заявки или определения номера заявки в сервисе событий.
    var transactionID: Int32 { get }
}

internal struct CancelOrderResultModel: CancelOrderResult {
    var clientID: String
    
    var transactionID: Int32
    
}

internal extension CancelOrderResultModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_CancelOrderResult) {
        self.clientID = grpcModel.clientID
        self.transactionID = grpcModel.transactionID
    }
}


internal extension Proto_Tradeapi_V1_CancelOrderResult {
    func toModel() -> CancelOrderResultModel {
        CancelOrderResultModel(grpcModel: self)
    }
}
