import Foundation

public protocol Security {

    /// Security code.
    /// Код инструмента.
    var code: String { get }

    /// Security board.
    /// Основной режим торгов инструмента.
    var board: String { get }

    /// Market.
    /// Рынок инструмента.
    var market: Market { get }

    /// Number of decimal digits in the price value.
    /// Количество знаков в дробной части цены.
    var decimals: Int32 { get }

    /// Lot size.
    /// Размер лота.
    var lotSize: Int32 { get }

    /// Price min step.
    /// Минимальный шаг цены.
    var minStep: Int32 { get }

    /// Currency.
    /// Валюта номинала инструмента.
    var currency: String { get }

    /// Security name.
    /// Название инструмента.
    var shortName: String { get }

    /// Параметры инструмента. Значение представлено в виде битовой маски.
    /// 0 Нет параметров.
    /// 1 Инструмент торгуется на Бирже.
    /// 2 Инструмент допущен к торгам у Брокера - существенно для НЕ ГЛАВНЫХ трейдеров, главным доступны все инструменты, торгуемые на биржах.
    /// 4 Рыночные заявки (без ограничения по цене) разрешены.
    /// 8 Признак маржинальности бумаги.
    /// 16 Опцион Call.
    /// 32 Опцион Put.
    /// 48 Фьючерс: Call | Put.
    /// 64 Разрешен для резидентов.
    /// 128 Разрешен для нерезидентов.
    var properties: Int32 { get }

    /// Timezone name.
    /// Имя таймзоны.
    var timeZoneName: String { get }

    /// The price unit cost for one security (not for the lot)), excluding accrued interest.
    /// Стоимость пункта цены одного инструмента (не лота), без учета НКД.
    var bpCost: Double { get }

    /// Current accrued interest.
    /// Текущий НКД.
    var accruedInterest: Double { get }

    /// Allowed price: positive, non negative, any.
    /// Допустимая цена: положительная, неотрицательная, любая.
    var priceSign: PriceSign { get }

    /// Ticker.
    /// Код инструмента (тикер) на биржевой площадке листинга.
    var ticker: String { get }

    /// The split ratio of a security in one standard lot.
    /// Коэффициент дробления ценной бумаги в одном стандартном лоте.
    var lotDivider: Int32 { get }

}

internal struct SecurityModel: Security {
    var code: String
    var board: String
    var market: Market
    var decimals: Int32
    var lotSize: Int32
    var minStep: Int32
    var currency: String
    var shortName: String
    var properties: Int32
    var timeZoneName: String
    var bpCost: Double
    var accruedInterest: Double
    var priceSign: PriceSign
    var ticker: String
    var lotDivider: Int32
}

internal extension SecurityModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_Security) throws {
        self.code = grpcModel.code
        self.board = grpcModel.board
        self.market = try .new(rawValue: grpcModel.market.rawValue)
        self.decimals = grpcModel.decimals
        self.lotSize = grpcModel.lotSize
        self.minStep = grpcModel.minStep
        self.currency = grpcModel.currency
        self.shortName = grpcModel.shortName
        self.shortName = grpcModel.shortName
        self.properties = grpcModel.properties
        self.timeZoneName = grpcModel.timeZoneName
        self.bpCost = grpcModel.bpCost
        self.accruedInterest = grpcModel.accruedInterest
        self.priceSign = try .new(rawValue: grpcModel.priceSign.rawValue)
        self.ticker = grpcModel.ticker
        self.lotDivider = grpcModel.lotDivider
    }
}

internal extension Proto_Tradeapi_V1_Security {
    func toModel() throws -> SecurityModel {
        try SecurityModel(grpcModel: self)
    }
}
