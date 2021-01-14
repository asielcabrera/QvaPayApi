
[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
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

To get the full benefits import `YourLibrary` wherever you import UIKit

``` swift
import UIKit
import QvaPayApi
```
#### Manually
1. Download and drop ```QvaPay.swift``` in your project.  
2. Congratulations!  

## Usage example

```swift
import QvaPay
var qvpay = QvaPayApi()

qvpay.getTransaction { transactions in

    // hacer algo con las transacciones que te devuelve
    // qvapay
    
}

var invoice: invoiceRequest = invoiceRequest(app_id, app_secret, amount, description, remote_id, signed)

qvpay.createInvoice(invoice: invoice){ responseData in

    // hacer lo que desees con la respuesta de qvapay

}

qvpay.getInfo { info in

    // hacer algo con la info que devuelve qvapay
    
}

qvpay.getBalance { balance in

    // hacer algo con el balance devuelto por qvapay
    
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
