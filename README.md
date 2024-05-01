# SDK Swift API Финам

FinamAPISwiftSDK — это библиотека методов для взаимодействия с брокером Финам на языке программирования Swift по протоколу gRPC [Финам](https://www.finam.ru/).

[Документация для разработчиков](https://finamweb.github.io/trade-api-docs/)

# Примеры решаемых задач

### Получение информации по инструментам

Через метод getSecurities FinamAPISwiftSDK можно получить список инстрментов у брокера Финам. 

```swift

import FinamAPISwiftSDK

func getSecurities(board: String?, seccode: String?) {
    do {
        try client?.securities.getSecurities(board: board, seccode: seccode).whenSuccess({ securities in
            print(securities.count)
        })
    } catch {
        let errorText = "Не удалось получить свечи"
        print(errorText)
    }
}

```

### Работа с ордерами. С помощью этой библиотеки можно выставить новый ордер (макет/лимит), отменить ордер, получить ордера.

```swift

import FinamAPISwiftSDK

func postOrder(securityBoard: String,
               securityCode: String,
               buySell: BuySell,
               quantity: Int32,
               useCredit: Bool,
               price: Double? = nil,
               property: OrderProperty,
               condition: OrderCondition? = nil,
               validBefore: OrderValidBefore? = nil) {
    do {
        try client?.orders.postOrder(clientID: clientID,
                                     securityBoard: securityBoard,
                                     securityCode: securityCode,
                                     buySell: buySell,
                                     quantity: quantity,
                                     useCredit: useCredit,
                                     price: price,
                                     property: property,
                                     condition: condition,
                                     validBefore: validBefore).whenComplete({ result in
            switch result {
            case .success(let orderInfo):
                print("Ордер выставлен \(orderInfo.transactionID)")
            case .failure(_):
                print("Ордер не выставлен")
            }
        })
        
    } catch {
        let errorText = "Не удалось выставить ордер в Финам"
        print(errorText)
    }
}

```

### Работа со стоп-заявками. С помощью этой библиотеки можно выставить новую стоп-заявку, отменить стоп-заявку, получить список стоп-приказов.

```swift

import FinamAPISwiftSDK

func newStop(securityBoard: String,
             securityCode: String,
             buySell: BuySell,
             stopLoss: StopLoss? = nil,
             takeProfit: TakeProfit? = nil,
             expirationDate: Date? = nil,
             linkOrder: Int64,
             validBefore: OrderValidBefore?) {
    do {
        try client?.stops.newStop(clientID: clientID,
                                  securityBoard: securityBoard,
                                  securityCode: securityCode,
                                  buySell: buySell,
                                  stopLoss: stopLoss,
                                  takeProfit: takeProfit,
                                  expirationDate: expirationDate,
                                  linkOrder: linkOrder,
                                  validBefore: validBefore).whenComplete({ result in
            switch result {
            case .success(let info):
                print("Стоп выставлен \(info.stopID)")
            case .failure(_):
                print("Стоп не выставлен")
            }
        })
        
    } catch {
        let errorText = "Не удалось выставить Стоп в Финам"
        print(errorText)
    }
}

```

### С помощью сервиса Portfolios можно запросить информацию по балансу, текущим активам в портфеле.

```swift

import FinamAPISwiftSDK

func getPortfolios(includeCurrencies: Bool,
                   includeMoney: Bool,
                   includePositions: Bool,
                   includeMaxBuySell: Bool) {
    let content = PortfolioContent(includeCurrencies: includeCurrencies,
                                   includeMoney: includeMoney,
                                   includePositions: includePositions,
                                   includeMaxBuySell: includeMaxBuySell)
    do {
        try client?.portfolios.getPortfolios(clientID: clientID,
                                             content: content).whenComplete({ result in
            switch result {
            case .success(let info):
                print("balance \(info.balance)")
            case .failure(let error):
                print("Инфо не получена")
            }
        })
        
    } catch {
        let errorText = "Не удалось получить портфолио в Финам"
        print(errorText)
    }
}

```

### В данной библиотеке реализована возможность подписки/отписки на стримы.

```swift

import FinamAPISwiftSDK

func subscribePrice(ticker: String, completion: @escaping (Decimal) -> Void) {
    let requestID = UUID().uuidString.truncate16()
    requestsID[ticker] = requestID
    Task {
        do {
            stream?.send(.orderBookSubscribe(requestID: requestID,
                                             securityCode: ticker,
                                             securityBoard: StorageSharesInfo.shared.getBoard(ticker: ticker)))
        }
    }
}

func unsubscribePrice(ticker: String) {
    let requestID = UUID().uuidString.truncate16()
    Task {
        do {
            stream?.send(.orderBookUnsubscribe(requestID: requestID,
                                               securityCode: ticker,
                                               securityBoard: StorageSharesInfo.shared.getBoard(ticker: ticker)))
        }
    }
}

```

# Функциональные возможности стримов
Библиотека FinamAPISwiftSDK предоставляя возможность следующего взаимодействия со стримом gRPC:
* Подписка на заявки и сделки;
* Удаление подписки на заявки и сделки;
* Подписка на биржевой стакан;
* Удаление подписки на биржевой стакан;

# О нюансах работы с Финам
На данный момент не все возможности реализованы в proto-контрактах Финам, например, нет возможности получения свечей через метода gRPC. 
Если вам необходимо получить свечи по инстрмуентам, то для этого имеется GET запрос.

[Swagger Финам](https://trade-api.finam.ru/swagger/index.html)

# Связь с создателем

* [Telegram-автора](https://t.me/vrshv)
