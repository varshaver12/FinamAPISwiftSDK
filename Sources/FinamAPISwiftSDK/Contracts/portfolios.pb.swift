// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: proto/tradeapi/v1/portfolios.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

/// What kind of data the response contains.
/// Какие данные будут в ответе.
struct Proto_Tradeapi_V1_PortfolioContent {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Currency positions.
  /// Валютные позиции.
  var includeCurrencies: Bool = false

  /// Money positions.
  /// Денежные позиции.
  var includeMoney: Bool = false

  /// DEPO positions.
  /// Позиции DEPO.
  var includePositions: Bool = false

  /// Buy and Sell limits.
  /// Лимиты покупки и продажи.
  var includeMaxBuySell: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// DEPO position.
/// Позиция DEPO.
struct Proto_Tradeapi_V1_PositionRow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Security Code.
  /// Тикер инструмента.
  var securityCode: String = String()

  /// Security market.
  /// Рынок инструмента.
  var market: Proto_Tradeapi_V1_Market = .unspecified

  /// Current position, items.
  /// Текущая позиция, шт.
  var balance: Int64 = 0

  /// Current price in price_currency.
  /// Текущая цена в валюте цены инструмента.
  var currentPrice: Double = 0

  /// Positions equity.
  /// Оценка позиции по инструменту в валюте риска.
  var equity: Double = 0

  /// Balanced price of security in price_currency.
  /// Балансовая цена в валюте цены инструмента.
  var averagePrice: Double = 0

  /// Risk currency.
  /// Валюта риска.
  var currency: String = String()

  /// P/L for initial position, in risk currency.
  /// Прибыль/убыток по входящей позиции, в валюте риска.
  var accumulatedProfit: Double = 0

  /// Daily P/L, in risk currency.
  /// Прибыль/убыток по сделкам за день, в валюте риска.
  var todayProfit: Double = 0

  /// Unrealized P/L, in average_price_currency.
  /// Нереализованные прибыль/убытки по балансовой цене в валюте инструмента.
  var unrealizedProfit: Double = 0

  /// P/L in price_currency.
  /// Прибыль/убытки в валюте цены инструмента.
  var profit: Double = 0

  /// Max lots to buy.
  /// Максимальное кол-во лотов, доступных для покупки.
  var maxBuy: Int64 = 0

  /// Max lots to sell.
  /// Максимальное кол-во лотов, доступных для продажи.
  var maxSell: Int64 = 0

  /// Security price currency.
  /// Валюта цены инструмента.
  var priceCurrency: String = String()

  /// Balanced price currency.
  /// Валюта балансовой цены.
  var averagePriceCurrency: String = String()

  /// Risk Currency to Price currency Cross rate.
  /// Кросс-курс валюты балансовой цены к валюте риска.
  var averageRate: Double = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Currency position.
/// Валютная позиция.
struct Proto_Tradeapi_V1_CurrencyRow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Currency code.
  /// Код валюты.
  var name: String = String()

  /// Current position.
  /// Текущая позиция.
  var balance: Double = 0

  /// Currency rate for RUB.
  /// Курс валюты к рублю.
  var crossRate: Double = 0

  /// Equity in RUB.
  /// Оценка в рублях.
  var equity: Double = 0

  /// Unrealized P/L, in RUB.
  /// Нереализованные прибыль/убытки в рублях.
  var unrealizedProfit: Double = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Money position.
/// Денежная позиция.
struct Proto_Tradeapi_V1_MoneyRow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Position market.
  /// Рынок позиции.
  var market: Proto_Tradeapi_V1_Market = .unspecified

  /// Currency code.
  /// Код валюты.
  var currency: String = String()

  /// Current position.
  /// Текущая позиция.
  var balance: Double = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Get Portfolio Request.
/// Запрос портфеля.
struct Proto_Tradeapi_V1_GetPortfolioRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Trade Account ID.
  /// Идентификатор торгового счёта.
  var clientID: String = String()

  /// What data to return by request.
  /// Какие данные возвращать в ответе.
  var content: Proto_Tradeapi_V1_PortfolioContent {
    get {return _content ?? Proto_Tradeapi_V1_PortfolioContent()}
    set {_content = newValue}
  }
  /// Returns true if `content` has been explicitly set.
  var hasContent: Bool {return self._content != nil}
  /// Clears the value of `content`. Subsequent reads from it will return its default value.
  mutating func clearContent() {self._content = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _content: Proto_Tradeapi_V1_PortfolioContent? = nil
}

/// GetPortfolioRequest result.
/// Результат GetPortfolioRequest.
struct Proto_Tradeapi_V1_GetPortfolioResult {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Trade Account ID.
  /// Идентификатор торгового счёта.
  var clientID: String = String()

  /// What kind of data the response contains.
  /// Какие данные будут в ответе.
  var content: Proto_Tradeapi_V1_PortfolioContent {
    get {return _content ?? Proto_Tradeapi_V1_PortfolioContent()}
    set {_content = newValue}
  }
  /// Returns true if `content` has been explicitly set.
  var hasContent: Bool {return self._content != nil}
  /// Clears the value of `content`. Subsequent reads from it will return its default value.
  mutating func clearContent() {self._content = nil}

  /// Current equity, RUB.
  /// Текущая оценка портфеля в рублях.
  var equity: Double = 0

  /// Open Equity, RUB.
  /// Входящая оценка портфеля в рублях.
  var balance: Double = 0

  /// DEPO positions.
  /// Позиции DEPO.
  var positions: [Proto_Tradeapi_V1_PositionRow] = []

  /// Currency positions.
  /// Валютные позиции.
  var currencies: [Proto_Tradeapi_V1_CurrencyRow] = []

  /// Money positions.
  /// Денежные позиции.
  var money: [Proto_Tradeapi_V1_MoneyRow] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _content: Proto_Tradeapi_V1_PortfolioContent? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Proto_Tradeapi_V1_PortfolioContent: @unchecked Sendable {}
extension Proto_Tradeapi_V1_PositionRow: @unchecked Sendable {}
extension Proto_Tradeapi_V1_CurrencyRow: @unchecked Sendable {}
extension Proto_Tradeapi_V1_MoneyRow: @unchecked Sendable {}
extension Proto_Tradeapi_V1_GetPortfolioRequest: @unchecked Sendable {}
extension Proto_Tradeapi_V1_GetPortfolioResult: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "proto.tradeapi.v1"

extension Proto_Tradeapi_V1_PortfolioContent: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PortfolioContent"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "include_currencies"),
    2: .standard(proto: "include_money"),
    3: .standard(proto: "include_positions"),
    4: .standard(proto: "include_max_buy_sell"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.includeCurrencies) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.includeMoney) }()
      case 3: try { try decoder.decodeSingularBoolField(value: &self.includePositions) }()
      case 4: try { try decoder.decodeSingularBoolField(value: &self.includeMaxBuySell) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.includeCurrencies != false {
      try visitor.visitSingularBoolField(value: self.includeCurrencies, fieldNumber: 1)
    }
    if self.includeMoney != false {
      try visitor.visitSingularBoolField(value: self.includeMoney, fieldNumber: 2)
    }
    if self.includePositions != false {
      try visitor.visitSingularBoolField(value: self.includePositions, fieldNumber: 3)
    }
    if self.includeMaxBuySell != false {
      try visitor.visitSingularBoolField(value: self.includeMaxBuySell, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Tradeapi_V1_PortfolioContent, rhs: Proto_Tradeapi_V1_PortfolioContent) -> Bool {
    if lhs.includeCurrencies != rhs.includeCurrencies {return false}
    if lhs.includeMoney != rhs.includeMoney {return false}
    if lhs.includePositions != rhs.includePositions {return false}
    if lhs.includeMaxBuySell != rhs.includeMaxBuySell {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Tradeapi_V1_PositionRow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PositionRow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "security_code"),
    2: .same(proto: "market"),
    3: .same(proto: "balance"),
    4: .standard(proto: "current_price"),
    5: .same(proto: "equity"),
    6: .standard(proto: "average_price"),
    7: .same(proto: "currency"),
    8: .standard(proto: "accumulated_profit"),
    9: .standard(proto: "today_profit"),
    10: .standard(proto: "unrealized_profit"),
    11: .same(proto: "profit"),
    12: .standard(proto: "max_buy"),
    13: .standard(proto: "max_sell"),
    14: .standard(proto: "price_currency"),
    15: .standard(proto: "average_price_currency"),
    16: .standard(proto: "average_rate"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.securityCode) }()
      case 2: try { try decoder.decodeSingularEnumField(value: &self.market) }()
      case 3: try { try decoder.decodeSingularInt64Field(value: &self.balance) }()
      case 4: try { try decoder.decodeSingularDoubleField(value: &self.currentPrice) }()
      case 5: try { try decoder.decodeSingularDoubleField(value: &self.equity) }()
      case 6: try { try decoder.decodeSingularDoubleField(value: &self.averagePrice) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.currency) }()
      case 8: try { try decoder.decodeSingularDoubleField(value: &self.accumulatedProfit) }()
      case 9: try { try decoder.decodeSingularDoubleField(value: &self.todayProfit) }()
      case 10: try { try decoder.decodeSingularDoubleField(value: &self.unrealizedProfit) }()
      case 11: try { try decoder.decodeSingularDoubleField(value: &self.profit) }()
      case 12: try { try decoder.decodeSingularInt64Field(value: &self.maxBuy) }()
      case 13: try { try decoder.decodeSingularInt64Field(value: &self.maxSell) }()
      case 14: try { try decoder.decodeSingularStringField(value: &self.priceCurrency) }()
      case 15: try { try decoder.decodeSingularStringField(value: &self.averagePriceCurrency) }()
      case 16: try { try decoder.decodeSingularDoubleField(value: &self.averageRate) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.securityCode.isEmpty {
      try visitor.visitSingularStringField(value: self.securityCode, fieldNumber: 1)
    }
    if self.market != .unspecified {
      try visitor.visitSingularEnumField(value: self.market, fieldNumber: 2)
    }
    if self.balance != 0 {
      try visitor.visitSingularInt64Field(value: self.balance, fieldNumber: 3)
    }
    if self.currentPrice != 0 {
      try visitor.visitSingularDoubleField(value: self.currentPrice, fieldNumber: 4)
    }
    if self.equity != 0 {
      try visitor.visitSingularDoubleField(value: self.equity, fieldNumber: 5)
    }
    if self.averagePrice != 0 {
      try visitor.visitSingularDoubleField(value: self.averagePrice, fieldNumber: 6)
    }
    if !self.currency.isEmpty {
      try visitor.visitSingularStringField(value: self.currency, fieldNumber: 7)
    }
    if self.accumulatedProfit != 0 {
      try visitor.visitSingularDoubleField(value: self.accumulatedProfit, fieldNumber: 8)
    }
    if self.todayProfit != 0 {
      try visitor.visitSingularDoubleField(value: self.todayProfit, fieldNumber: 9)
    }
    if self.unrealizedProfit != 0 {
      try visitor.visitSingularDoubleField(value: self.unrealizedProfit, fieldNumber: 10)
    }
    if self.profit != 0 {
      try visitor.visitSingularDoubleField(value: self.profit, fieldNumber: 11)
    }
    if self.maxBuy != 0 {
      try visitor.visitSingularInt64Field(value: self.maxBuy, fieldNumber: 12)
    }
    if self.maxSell != 0 {
      try visitor.visitSingularInt64Field(value: self.maxSell, fieldNumber: 13)
    }
    if !self.priceCurrency.isEmpty {
      try visitor.visitSingularStringField(value: self.priceCurrency, fieldNumber: 14)
    }
    if !self.averagePriceCurrency.isEmpty {
      try visitor.visitSingularStringField(value: self.averagePriceCurrency, fieldNumber: 15)
    }
    if self.averageRate != 0 {
      try visitor.visitSingularDoubleField(value: self.averageRate, fieldNumber: 16)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Tradeapi_V1_PositionRow, rhs: Proto_Tradeapi_V1_PositionRow) -> Bool {
    if lhs.securityCode != rhs.securityCode {return false}
    if lhs.market != rhs.market {return false}
    if lhs.balance != rhs.balance {return false}
    if lhs.currentPrice != rhs.currentPrice {return false}
    if lhs.equity != rhs.equity {return false}
    if lhs.averagePrice != rhs.averagePrice {return false}
    if lhs.currency != rhs.currency {return false}
    if lhs.accumulatedProfit != rhs.accumulatedProfit {return false}
    if lhs.todayProfit != rhs.todayProfit {return false}
    if lhs.unrealizedProfit != rhs.unrealizedProfit {return false}
    if lhs.profit != rhs.profit {return false}
    if lhs.maxBuy != rhs.maxBuy {return false}
    if lhs.maxSell != rhs.maxSell {return false}
    if lhs.priceCurrency != rhs.priceCurrency {return false}
    if lhs.averagePriceCurrency != rhs.averagePriceCurrency {return false}
    if lhs.averageRate != rhs.averageRate {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Tradeapi_V1_CurrencyRow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CurrencyRow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "balance"),
    3: .standard(proto: "cross_rate"),
    4: .same(proto: "equity"),
    5: .standard(proto: "unrealized_profit"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 2: try { try decoder.decodeSingularDoubleField(value: &self.balance) }()
      case 3: try { try decoder.decodeSingularDoubleField(value: &self.crossRate) }()
      case 4: try { try decoder.decodeSingularDoubleField(value: &self.equity) }()
      case 5: try { try decoder.decodeSingularDoubleField(value: &self.unrealizedProfit) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    if self.balance != 0 {
      try visitor.visitSingularDoubleField(value: self.balance, fieldNumber: 2)
    }
    if self.crossRate != 0 {
      try visitor.visitSingularDoubleField(value: self.crossRate, fieldNumber: 3)
    }
    if self.equity != 0 {
      try visitor.visitSingularDoubleField(value: self.equity, fieldNumber: 4)
    }
    if self.unrealizedProfit != 0 {
      try visitor.visitSingularDoubleField(value: self.unrealizedProfit, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Tradeapi_V1_CurrencyRow, rhs: Proto_Tradeapi_V1_CurrencyRow) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.balance != rhs.balance {return false}
    if lhs.crossRate != rhs.crossRate {return false}
    if lhs.equity != rhs.equity {return false}
    if lhs.unrealizedProfit != rhs.unrealizedProfit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Tradeapi_V1_MoneyRow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MoneyRow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "market"),
    2: .same(proto: "currency"),
    3: .same(proto: "balance"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularEnumField(value: &self.market) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.currency) }()
      case 3: try { try decoder.decodeSingularDoubleField(value: &self.balance) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.market != .unspecified {
      try visitor.visitSingularEnumField(value: self.market, fieldNumber: 1)
    }
    if !self.currency.isEmpty {
      try visitor.visitSingularStringField(value: self.currency, fieldNumber: 2)
    }
    if self.balance != 0 {
      try visitor.visitSingularDoubleField(value: self.balance, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Tradeapi_V1_MoneyRow, rhs: Proto_Tradeapi_V1_MoneyRow) -> Bool {
    if lhs.market != rhs.market {return false}
    if lhs.currency != rhs.currency {return false}
    if lhs.balance != rhs.balance {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Tradeapi_V1_GetPortfolioRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetPortfolioRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "client_id"),
    2: .same(proto: "content"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.clientID) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._content) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.clientID.isEmpty {
      try visitor.visitSingularStringField(value: self.clientID, fieldNumber: 1)
    }
    try { if let v = self._content {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Tradeapi_V1_GetPortfolioRequest, rhs: Proto_Tradeapi_V1_GetPortfolioRequest) -> Bool {
    if lhs.clientID != rhs.clientID {return false}
    if lhs._content != rhs._content {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Proto_Tradeapi_V1_GetPortfolioResult: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetPortfolioResult"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "client_id"),
    2: .same(proto: "content"),
    3: .same(proto: "equity"),
    4: .same(proto: "balance"),
    5: .same(proto: "positions"),
    6: .same(proto: "currencies"),
    7: .same(proto: "money"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.clientID) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._content) }()
      case 3: try { try decoder.decodeSingularDoubleField(value: &self.equity) }()
      case 4: try { try decoder.decodeSingularDoubleField(value: &self.balance) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.positions) }()
      case 6: try { try decoder.decodeRepeatedMessageField(value: &self.currencies) }()
      case 7: try { try decoder.decodeRepeatedMessageField(value: &self.money) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.clientID.isEmpty {
      try visitor.visitSingularStringField(value: self.clientID, fieldNumber: 1)
    }
    try { if let v = self._content {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    if self.equity != 0 {
      try visitor.visitSingularDoubleField(value: self.equity, fieldNumber: 3)
    }
    if self.balance != 0 {
      try visitor.visitSingularDoubleField(value: self.balance, fieldNumber: 4)
    }
    if !self.positions.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.positions, fieldNumber: 5)
    }
    if !self.currencies.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.currencies, fieldNumber: 6)
    }
    if !self.money.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.money, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Proto_Tradeapi_V1_GetPortfolioResult, rhs: Proto_Tradeapi_V1_GetPortfolioResult) -> Bool {
    if lhs.clientID != rhs.clientID {return false}
    if lhs._content != rhs._content {return false}
    if lhs.equity != rhs.equity {return false}
    if lhs.balance != rhs.balance {return false}
    if lhs.positions != rhs.positions {return false}
    if lhs.currencies != rhs.currencies {return false}
    if lhs.money != rhs.money {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}