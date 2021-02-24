
[![Swift Version][swift-image]][swift-url]
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)

# QvaPayApi
<br />
<p align="center">
  <a href="https://github.com/asielcabrera/
QvaPayApi">
    <img src="Sources/QvaPay/qvapay-logo-l.png" alt="Logo" width="80" height="80">
  </a>
  <p align="center">
    QvaPayApi es un SwiftPackage para el consumo de la pasarela de pago QvaPay.
  </p>
</p>

## Features

- [x] Obtener Transacciones 1
- [x] Crear Una Transaccion
- [x] Obtener el Balance
- [x] Obtener la Info
- [ ] UI

## Requirements

- iOS 8.0+
- Xcode 7.3

## Installation

#### CocoaPods
Puedes usar [Swift Package](http://cocoapods.org/) para instalar `QvaPayApi` con esta URL:

```git
https://github.com/asielcabrera/QvaPayApi.git
```

To get the full benefits import `QvaPay` wherever you import UIKit

``` swift
import SwiftUI
import QvaPay
```
#### Manually
1. Download and drop ```credentials.json``` with the content {"app_id":"token_app_id", "app_secrect": "your_token_app_secrect" } in your project.  
2. Congratulations!  

## Usage example
First import a credentials.plis inside your proyect and them..


```swift
import QvaPay
struct QvaPayViewExample: View {
    @StateObject private var qvpay: QvaPayApiNetwork = QvaPayApiNetwork()
    
    var body: some View {
        return VStack ( spacing: 10){
            if let data = qvpay.MerchandInfo {
                VStack(spacing: 15){
                    Text(data.name)
                    Text(data.uuid)
                    Text(data.desc)
                }
                VStack {
                   if let trans: Transaction = qvpay.transactions {
                       List(trans){ tra in
                            Text(tra.total)
                        }
                    }
                    Text("BALANCE -- \(self.qvpay.Balance)")
                    
                    Button {
                        self.qvpay.getTransactions()
                        print(self.qvpay.transactions as Any)
                    } label: {
                        Text("Get Transaction")
                    }.padding()
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(10)

                    Button {
                        self.qvpay.createInvoice(invoice: InvoiceRequest(amount: 45, description: "prueba numero uno"))
                        print("invoice")
                    } label: {
                        Text("Invoice")
                    }.padding()
                    .buttonStyle(PlainButtonStyle())
                    .background(Color.blue.opacity(0.7))
                    .cornerRadius(10)
                }
                
            } else {
                Text("done")
            }
        }
    }
}

```

## Contribute

We would love you for the contribution to **QvaPayApi**, check the ``LICENSE`` file for more info.

## Meta

Your Name – [@asiel_cabrera](https://twitter.com/asiel_cabrera) – cabrerasiel@gmail.com

Distributed under the XYZ license. See ``LICENSE`` for more information.

[https://github.com/asielcabrera/](https://github.com/asielcabrera/)

[swift-image]:https://img.shields.io/badge/swift-3.0-orange.svg
[swift-url]: https://swift.org/
