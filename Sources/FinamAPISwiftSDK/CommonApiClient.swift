import NIOCore

public protocol CommonApiClient {

    /// Сервис работы с торговыми поручениями.
    var orders: OrdersService { get }
    
    func sendRequest<Result>(_ request: CommonApiRequest<Result>) throws -> EventLoopFuture<Result>
    
#if compiler(>=5.5) && canImport(_Concurrency)

    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func sendRequest<Result>(_ request: CommonAsyncApiRequest<Result>) async throws -> Result

#endif
}

public extension CommonApiClient {
    func sendRequest<Result>(_ request: CommonApiRequest<Result>) throws -> EventLoopFuture<Result> {
        return try request.send(client: self)
    }
}

internal final class CommonFinamApiClient: CommonApiClient {
    
    var orders: OrdersService
    
    private let connection: ApiConnection

    
    init(_ target: ApiTarget, token: String) throws {
        self.connection = try ApiConnection(target: target)
        let builder = ServicesBuilder(self.connection.channel, token: token)
        self.orders = builder.makeOrdersService()
    }
    
    deinit {
        self.connection.close()
    }
}

