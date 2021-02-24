//
//  File.swift
//  
//
//  Created by Asiel Cabrera on 1/14/21.
//

import Foundation
import SwiftUI

public struct Transaction: Codable {
    public let currentPage: Int
    public let data: [Datum]
    public let firstPageURL: String
    public let from: Int
    public let lastPage: Int
    public let lastPageURL: String
    public let nextPageURL: String?
    public let path: String
    public let perPage: Int
    public let prevPageURL: String?
    public let to: Int
    public let total: Int

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case data = "data"
        case firstPageURL = "first_page_url"
        case from = "from"
        case lastPage = "last_page"
        case lastPageURL = "last_page_url"
        case nextPageURL = "next_page_url"
        case path = "path"
        case perPage = "per_page"
        case prevPageURL = "prev_page_url"
        case to = "to"
        case total = "total"
    }

    public init(currentPage: Int, data: [Datum], firstPageURL: String, from: Int, lastPage: Int, lastPageURL: String, nextPageURL: String?, path: String, perPage: Int, prevPageURL: String?, to: Int, total: Int) {
        self.currentPage = currentPage
        self.data = data
        self.firstPageURL = firstPageURL
        self.from = from
        self.lastPage = lastPage
        self.lastPageURL = lastPageURL
        self.nextPageURL = nextPageURL
        self.path = path
        self.perPage = perPage
        self.prevPageURL = prevPageURL
        self.to = to
        self.total = total
    }
}

// MARK: - Datum
public struct Datum: Codable {
    public let uuid: String
    public let userID: Int
    public let appID: Int
    public let amount: String
    public let datumDescription: String
    public let remoteID: String
    public let status: String
    public let paidByUserID: Int
    public let createdAt: String
    public let updatedAt: String
    public let signed: Int

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case userID = "user_id"
        case appID = "app_id"
        case amount = "amount"
        case datumDescription = "description"
        case remoteID = "remote_id"
        case status = "status"
        case paidByUserID = "paid_by_user_id"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case signed = "signed"
    }

    public init(uuid: String, userID: Int, appID: Int, amount: String, datumDescription: String, remoteID: String, status: String, paidByUserID: Int, createdAt: String, updatedAt: String, signed: Int) {
        self.uuid = uuid
        self.userID = userID
        self.appID = appID
        self.amount = amount
        self.datumDescription = datumDescription
        self.remoteID = remoteID
        self.status = status
        self.paidByUserID = paidByUserID
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.signed = signed
    }
}
