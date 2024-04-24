import GRPC
import NIOHPACK

internal class ServicesBuilder {
    private let channel: GRPCChannel
    private let callOptions: CallOptions
    
    init(_ channel: GRPCChannel, token: String) {
        self.channel = channel
        let headers = HPACKHeaders([("Authorization", "Bearer \(token)")])
        self.callOptions = CallOptions(customMetadata: headers)
    }
    
    func makeOrdersService() -> OrdersService  {
        let client = OrdersServiceClient(
            channel: self.channel,
            defaultCallOptions: self.callOptions
        )
        return GrpcOrdersService(client)
    }
    
}
