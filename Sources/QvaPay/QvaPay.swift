import Foundation
import SwiftUI

class QvaPayApi {
    private var version: String = "v1"
    private var urlBasic: String
    private var app_id: String
    private var app_secret: String
    
    private init() {
        self.urlBasic = "https://qvapay.com/api/\(self.version)/"
        self.app_id = credentials.app_id
        self.app_secret = credentials.app_secrect
    }
    
    
    func createInvoice(with invoice: InvoiceRequest, completion: @escaping (_ DataResponse: InvoiceResponse)-> Void){
        guard let url = URL(string: self.urlBasic + "create_invoice") else { return }
        
        let parameters = invoice.proccess()
        let postData =  parameters.data(using: .utf8)
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let res = try! JSONDecoder().decode(InvoiceResponse.self, from: data)
            
            completion(res)
        }

        task.resume()
    }
    
    func getTransactions(completion: @escaping (_ DataResponse: TransactionResponse)-> Void) {
        guard let url = URL(string: self.urlBasic + "transactions?app_id=\(self.app_id)&app_secret=\(self.app_secret)") else { return }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let res = try! JSONDecoder().decode(TransactionResponse.self, from: data)
            
            completion(res)
        }

        task.resume()
    }
    
    func getBalance(completion: @escaping (_ DataResponse: Int)-> Void){
        guard let url = URL(string: self.urlBasic + "balance?app_id=\(self.app_id)&app_secret=\(self.app_secret)") else { return }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let res = try! JSONDecoder().decode(Int.self, from: data)
            
            completion(res)
        }

        task.resume()
    }
    func getInfo(completion: @escaping (_ InfoData: Int)-> Void){
        guard let url = URL(string: self.urlBasic + "info?app_id=\(self.app_id)&app_secret=\(self.app_secret)") else { return }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
          guard let data = data else {
            print(String(describing: error))
            return
          }
            let res = try! JSONDecoder().decode(Int.self, from: data)
            
            completion(res)
        }

        task.resume()
    }
}

@available(OSX 10.15.0, *)
struct QvaPay: View {
    var body: some View {
        Text("hola desde qvapay api")
    }
}
