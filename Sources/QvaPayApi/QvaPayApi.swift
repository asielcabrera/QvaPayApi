import Foundation
import SwiftUI
import Combine
@available(iOS 13.0, *)

public class QvaPayApiNetwork: ObservableObject {
    @Published public var MerchandInfo: InfoData?
    @Published public var transactions: Transaction?
    @Published public var InvoiceResponse: Invoice?
    @Published public var Balance: Double = 0
    
    private var version: String = "v1"
    private var urlBasic: String
    private var app_id: String
    private var app_secret: String
    
    public init() {
        self.urlBasic = "https://qvapay.com/api/\(self.version)/"
        self.app_id = credentials.app_id
        self.app_secret = credentials.app_secrect
        self.getMerchand()
        
    }
    public func getMerchand() {
        guard let url = URL(string: self.urlBasic + "info?app_id=\(self.app_id)&app_secret=\(self.app_secret)") else { return }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let res = try! JSONDecoder().decode(InfoData.self, from: data)
            DispatchQueue.main.async {
                self.MerchandInfo = res
            }
        }
        
        task.resume()
    }
    
    public func getTransactions() {
        guard let url = URL(string: self.urlBasic + "transactions?app_id=\(self.app_id)&app_secret=\(self.app_secret)") else { return }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let transaction = try? JSONDecoder().decode(Transaction.self, from: data)
            DispatchQueue.main.async {
                self.transactions = transaction
            }
        }
        
        task.resume()
    }
    public func getBalance() {
        guard let url = URL(string: self.urlBasic + "balance?app_id=\(self.app_id)&app_secret=\(self.app_secret)") else { return }
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let balanceResponse = try? JSONDecoder().decode(Double.self, from: data)
            DispatchQueue.main.async {
                self.Balance = balanceResponse!
            }
        }
        
        task.resume()
    }
    public func createInvoice(invoice: InvoiceRequest){
        guard let url = URL(string: self.urlBasic + "create_invoice?app_id=\(self.app_id)&app_secret=\(self.app_secret)&amount=\(invoice.amount)&description=\(invoice.description))&remote_id=\(invoice.remote_id ?? "")&signed=\(invoice.signed ?? "")") else { return }
        
        print(url)
        
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            let res = try! JSONDecoder().decode(Invoice.self, from: data)
            DispatchQueue.main.async {
                self.InvoiceResponse = res
                print(res)
            }
        }
        
        task.resume()
    }
}

