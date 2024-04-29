/// DEPO position.
/// Позиция DEPO.
public protocol PositionRow {

  /// Security Code.
  /// Тикер инструмента.
  var securityCode: String { get }

  /// Security market.
  /// Рынок инструмента.
    var market: Market { get }

  /// Current position, items.
  /// Текущая позиция, шт.
    var balance: Int64 { get }

  /// Current price in price_currency.
  /// Текущая цена в валюте цены инструмента.
    var currentPrice: Double { get }

  /// Positions equity.
  /// Оценка позиции по инструменту в валюте риска.
    var equity: Double { get }

  /// Balanced price of security in price_currency.
  /// Балансовая цена в валюте цены инструмента.
    var averagePrice: Double { get }

  /// Risk currency.
  /// Валюта риска.
    var currency: String { get }

  /// P/L for initial position, in risk currency.
  /// Прибыль/убыток по входящей позиции, в валюте риска.
    var accumulatedProfit: Double { get }

  /// Daily P/L, in risk currency.
  /// Прибыль/убыток по сделкам за день, в валюте риска.
    var todayProfit: Double { get }

  /// Unrealized P/L, in average_price_currency.
  /// Нереализованные прибыль/убытки по балансовой цене в валюте инструмента.
    var unrealizedProfit: Double { get }

  /// P/L in price_currency.
  /// Прибыль/убытки в валюте цены инструмента.
    var profit: Double { get }

  /// Max lots to buy.
  /// Максимальное кол-во лотов, доступных для покупки.
    var maxBuy: Int64 { get }

  /// Max lots to sell.
  /// Максимальное кол-во лотов, доступных для продажи.
    var maxSell: Int64 { get }

  /// Security price currency.
  /// Валюта цены инструмента.
    var priceCurrency: String { get }

  /// Balanced price currency.
  /// Валюта балансовой цены.
    var averagePriceCurrency: String { get }

  /// Risk Currency to Price currency Cross rate.
  /// Кросс-курс валюты балансовой цены к валюте риска.
    var averageRate: Double { get }

}

internal struct PositionRowModel: PositionRow {
    var securityCode: String
    var market: Market
    var balance: Int64
    var currentPrice: Double
    var equity: Double
    var averagePrice: Double
    var currency: String
    var accumulatedProfit: Double
    var todayProfit: Double
    var unrealizedProfit: Double
    var profit: Double
    var maxBuy: Int64
    var maxSell: Int64
    var priceCurrency: String
    var averagePriceCurrency: String
    var averageRate: Double
}

internal extension PositionRowModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_PositionRow) {
        self.securityCode = grpcModel.securityCode
        self.balance = grpcModel.balance
        self.currentPrice = grpcModel.currentPrice
        self.equity = grpcModel.equity
        self.averagePrice = grpcModel.averagePrice
        self.currency = grpcModel.currency
        self.accumulatedProfit = grpcModel.accumulatedProfit
        self.todayProfit = grpcModel.todayProfit
        self.unrealizedProfit = grpcModel.unrealizedProfit
        self.profit = grpcModel.profit
        self.maxBuy = grpcModel.maxBuy
        self.maxSell = grpcModel.maxSell
        self.priceCurrency = grpcModel.priceCurrency
        self.averagePriceCurrency = grpcModel.averagePriceCurrency
        self.averageRate = grpcModel.averageRate
        do {
            self.market = try .new(rawValue: grpcModel.market.rawValue)
        } catch {
            self.market = .unspecified
        }
    }
}

internal extension Proto_Tradeapi_V1_PositionRow {
    func toModel() -> PositionRowModel {
        PositionRowModel(grpcModel: self)
    }
}
