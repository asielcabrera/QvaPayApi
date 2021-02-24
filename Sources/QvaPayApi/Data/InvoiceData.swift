//
//  File.swift
//  
//
//  Created by Asiel Cabrera on 1/14/21.
//

import SwiftUI

public struct Invoice: Codable {
    public let appID: String
    public let appSecret: String
    public let amount: String
    public let invoiceDescription: String
    public let remoteID: String
    public let signed: String
    public let url: String
    public let signedURL: String

    enum CodingKeys: String, CodingKey {
        case appID = "app_id"
        case appSecret = "app_secret"
        case amount = "amount"
        case invoiceDescription = "description"
        case remoteID = "remote_id"
        case signed = "signed"
        case url = "url"
        case signedURL = "signedUrl"
    }

    public init(appID: String, appSecret: String, amount: String, invoiceDescription: String, remoteID: String, signed: String, url: String, signedURL: String) {
        self.appID = appID
        self.appSecret = appSecret
        self.amount = amount
        self.invoiceDescription = invoiceDescription
        self.remoteID = remoteID
        self.signed = signed
        self.url = url
        self.signedURL = signedURL
    }
}

public struct InvoiceRequest {
    
    
    public var amount: Double
    public var description: String
    public var remote_id: String?
    public var signed: String?
    public init(amount: Double, description: String, remote_id: String? = nil, signed: String? = nil) {
        self.amount = amount
        self.description = description
        self.remote_id = remote_id
        self.signed = signed
    }
}
