import NIOCore

public protocol CommonApiClient {

}

internal final class CommonFinamApiClient: CommonApiClient {
    private let connection: ApiConnection

    
    init(_ target: ApiTarget, token: String) throws {
        self.connection = try ApiConnection(target: target)
        let builder = ServicesBuilder(self.connection.channel, token: token)

    }
    
    deinit {
        self.connection.close()
    }
}

