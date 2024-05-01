import NIOCore

public protocol ApiClient {

    /// Сервис работы с торговыми поручениями.
    var orders: OrdersService { get }
    
    /// Сервис предоставления справочной информации о ценных бумагах.
    var securities: SecuritiesService { get }
    
    /// Сервис работы со стоп-заявками.
    var stops: StopsService { get }
    
    /// Сервис получения структуры портфеля.
    var portfolios: PortfoliosService { get }
    
    var eventsStream: EventsStreamService { get }
    
    func sendRequest<Result>(_ request: CommonApiRequest<Result>) throws -> EventLoopFuture<Result>
    
#if compiler(>=5.5) && canImport(_Concurrency)

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func sendRequest<Result>(_ request: AsyncRequest<Result>) async throws -> Result

#endif
}

public extension ApiClient {
    func sendRequest<Result>(_ request: CommonApiRequest<Result>) throws -> EventLoopFuture<Result> {
        return try request.send(client: self)
    }
}

internal final class CommonFinamApiClient: ApiClient {
    
    var orders: OrdersService
    var securities: SecuritiesService
    var stops: StopsService
    var portfolios: PortfoliosService
    var eventsStream: EventsStreamService
    
    private let connection: ApiConnection

    
    init(_ target: ApiTarget, token: String, appName: String) throws {
        self.connection = try ApiConnection(target: target)
        let builder = ServicesBuilder(self.connection.channel, token: token, appName: appName)
        self.orders = builder.makeOrdersService()
        self.securities = builder.makeSecuritiesService()
        self.stops = builder.makeStopsService()
        self.portfolios = builder.makePortfoliosService()
        self.eventsStream = builder.makeEventsStreamService()
    }
    
    deinit {
        self.connection.close()
    }
}

