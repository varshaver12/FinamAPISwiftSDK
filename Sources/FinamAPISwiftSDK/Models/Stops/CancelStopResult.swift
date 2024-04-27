import Foundation

/// Информация о биржевой заявке.
public protocol CancelStopResult {
    /// Trade Account Id.
    /// Идентификатор торгового счёта.
    var clientID: String { get }

    /// Stop Order Id.
    /// Идентификатор стоп-заявки.
    var stopID: Int32 { get }
}

internal struct CancelStopResultModel: CancelStopResult {
    var clientID: String
    var stopID: Int32
}

internal extension CancelStopResultModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_CancelStopResult) {
        self.clientID = grpcModel.clientID
        self.stopID = grpcModel.stopID
    }
}


internal extension Proto_Tradeapi_V1_CancelStopResult {
    func toModel() -> CancelStopResultModel {
        CancelStopResultModel(grpcModel: self)
    }
}
