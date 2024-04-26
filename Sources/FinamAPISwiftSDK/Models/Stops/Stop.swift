import Foundation

/// Order.
/// Заявка.
public protocol Stop {

    /// Stop Order Id.
    /// Идентификатор стоп-заявки.
    var stopID: Int32 { get }

    /// Security Code.
    /// Тикер инструмента.
    var securityCode: String { get }

    /// Security Board.
    /// Основной режим торгов инструмента.
    var securityBoard: String { get }

    /// Market.
    /// Рынок.
    var market: Market { get }

    /// Trade Account ID.
    /// Идентификатор торгового счёта.
    var clientID: String { get }

    /// Transaction direction.
    /// Направление сделки.
    var buySell: BuySell { get }

    /// Expiration date for FORTS order.
    /// Дата экспирации заявки FORTS.
    var expirationDate: Date? { get }

    /// Linked order ID.
    /// Биржевой номер связанной (активной) заявки.
    var linkOrder: Int64 { get }

    /// Order lifetime.
    /// Время действия заявки.
    var validBefore: OrderValidBefore? { get }

    /// Order status.
    /// Состояние заявки.
    var status: StopStatus { get }

    /// Rejection reason or conditional order resolution.
    /// Причина отказа или вердикт по условной заявке.
    var message: String { get }

    /// Order No.
    /// Номер заявки, полученной в результате исполнения стопа.
    var orderNo: Int64 { get }

    /// Trade No.
    /// Номер сделки, которая привела к исполнению стопа.
    var tradeNo: Int64 { get }

    /// Time of order registration on the server in UTC.
    /// Время, когда заявка была зарегистрирована на сервере. В UTC.
    var acceptedAt: Date? { get }

    /// Time of order canceled on the server in UTC.
    /// Время, когда заявка была отменена на сервере. В UTC.
    var canceledAt: Date? { get }

    /// Price currency.
    /// Валюта цены.
    var currency: String { get }

    /// Take profit: local extremum.
    /// Тейк профит: текущий локальный экстремум.
    var takeProfitExtremum: Double { get }

    /// Take profit: correction level.
    /// Тейк профит: текущий уровень коррекции.
    var takeProfitLevel: Double { get }

    /// Stop loss.
    /// Стоп лосс.
    var stopLoss: StopLoss? { get }

    /// Take profit.
    /// Тейк профит.
    var takeProfit: TakeProfit? { get }

}

internal struct StopModel: Stop {
    var stopID: Int32
    var securityCode: String
    var securityBoard: String
    var market: Market
    var clientID: String
    var buySell: BuySell
    var expirationDate: Date?
    var linkOrder: Int64
    var validBefore: OrderValidBefore?
    var status: StopStatus
    var message: String
    var orderNo: Int64
    var tradeNo: Int64
    var acceptedAt: Date?
    var canceledAt: Date?
    var currency: String
    var takeProfitExtremum: Double
    var takeProfitLevel: Double
    var stopLoss: StopLoss?
    var takeProfit: TakeProfit?
}

internal extension StopModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_Stop) throws {
        self.stopID = grpcModel.stopID
        self.securityCode = grpcModel.securityCode
        self.securityBoard = grpcModel.securityBoard
        self.market = try .new(rawValue: grpcModel.market.rawValue)
        self.clientID = grpcModel.clientID
        self.buySell = try .new(rawValue: grpcModel.buySell.rawValue)
        self.expirationDate = grpcModel.expirationDate.date
        self.linkOrder = grpcModel.linkOrder
        self.validBefore = try grpcModel.validBefore.toModel()
        self.status = try .new(rawValue: grpcModel.status.rawValue)
        self.message = grpcModel.message
        self.orderNo = grpcModel.orderNo
        self.tradeNo = grpcModel.tradeNo
        self.acceptedAt = grpcModel.acceptedAt.date
        self.canceledAt = grpcModel.canceledAt.date
        self.currency = grpcModel.currency
        self.takeProfitExtremum = grpcModel.takeProfitExtremum
        self.takeProfitLevel = grpcModel.takeProfitLevel
        self.stopLoss = try grpcModel.stopLoss.toModel()
        self.takeProfit = try grpcModel.takeProfit.toModel()
    }
}

internal extension Proto_Tradeapi_V1_Stop {
    func toModel() throws -> StopModel {
        try StopModel(grpcModel: self)
    }
}
