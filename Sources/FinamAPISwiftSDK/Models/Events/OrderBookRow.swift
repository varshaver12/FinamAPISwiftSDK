/// Order book row.
/// Строка стакана.
public protocol OrderBookRow {
    /// Price.
    /// Цена.
    var price: Double { get }
    
    /// Lots.
    /// Количество лотов.
    var quantity: Int64 { get }
    
}

internal struct OrderBookRowModel: OrderBookRow {
    var price: Double
    var quantity: Int64
}

internal extension OrderBookRowModel {
    fileprivate init(grpcModel: Proto_Tradeapi_V1_OrderBookRow) {
        self.price = grpcModel.price
        self.quantity = grpcModel.quantity
    }
}

internal extension Proto_Tradeapi_V1_OrderBookRow {
    func toModel() -> OrderBookRowModel {
        OrderBookRowModel(grpcModel: self)
    }
}
