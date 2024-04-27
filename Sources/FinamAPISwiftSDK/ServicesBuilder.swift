import GRPC
import NIOHPACK

internal class ServicesBuilder {
    private let channel: GRPCChannel
    private let callOptions: CallOptions
    
    init(_ channel: GRPCChannel, token: String, appName: String) {
        self.channel = channel
        let headers = HPACKHeaders([("x-api-key", "\(token)"), ("x-app-name", appName)])
        self.callOptions = CallOptions(customMetadata: headers)
    }
    
    func makeOrdersService() -> OrdersService  {
        let client = OrdersServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcOrdersService(client)
    }
    
    func makeSecuritiesService() -> SecuritiesService  {
        let client = SecuritiesServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcSecuritiesService(client)
    }
    
    func makeStopsService() -> StopsService  {
        let client = StopsServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcStopsService(client)
    }
    
    func makePortfoliosService() -> PortfoliosService  {
        let client = PortfoliosServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcPortfoliosService(client)
    }
    
}
