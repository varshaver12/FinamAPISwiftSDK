import Foundation

/// Информация о биржевой заявке.
public protocol NewStopResult {
    /// Trade Account Id.
    /// Идентификатор торгового счёта.
    var clientID: String { get }

    /// Stop Order Id.
    /// Идентификатор стоп-заявки.
    var stopID: Int32 { get }
    
    /// Security Code.
    /// Тикер инструмента.
    var securityCode: String { get }

    /// Trading Board.
    /// Режим торгов.
    var securityBoard: String { get }
}

internal struct NewStopResultModel: NewStopResult {
    var clientID: String
    var stopID: Int32
    var securityCode: String
    var securityBoard: String
}

internal extension NewStopResultModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_NewStopResult) {
        self.clientID = grpcModel.clientID
        self.stopID = grpcModel.stopID
        self.securityCode = grpcModel.securityCode
        self.securityBoard = grpcModel.securityBoard
    }
}


internal extension Proto_Tradeapi_V1_NewStopResult {
    func toModel() -> NewStopResultModel {
        NewStopResultModel(grpcModel: self)
    }
}
