# QvaPayApi


QvaPayApi es un SwiftPackage para el consumo de la pasarela de pago QvaPay.

# Como agregar a su proyecto de Xcode? 

1. Xcode
2. File
3. Swift Package
4. Add Package Dependency
5. Agregue esta URL:
	```https://github.com/asielcabrera/QvaPayApi.git```

# USO
```swift
import SwiftUI

import QvaPayApi

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
