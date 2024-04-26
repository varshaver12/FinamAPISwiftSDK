import Foundation

/// Информация о биржевой заявке.
public protocol NewOrderResult {
    /// Trade Account Id.
    /// Идентификатор торгового счёта.
    var clientID: String { get }
    
    /// Transaction Id, which can be used to cancel order or find corresponding order_no in Event service.
    /// Идентификатор транзакции, который может быть использован для отмены заявки или определения номера заявки в сервисе событий.
    var transactionID: Int32 { get }
    
    /// Security Code.
    /// Тикер инструмента.
    var securityCode: String { get }
}

internal struct NewOrderResultModel: NewOrderResult {
    var clientID: String
    
    var transactionID: Int32
    
    var securityCode: String
  
}

internal extension NewOrderResultModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_NewOrderResult) {
        self.clientID = grpcModel.clientID
        self.transactionID = grpcModel.transactionID
        self.securityCode = grpcModel.securityCode
    }
}

internal extension Proto_Tradeapi_V1_NewOrderResult {
    func toModel() -> NewOrderResultModel {
        NewOrderResultModel(grpcModel: self)
    }
}

