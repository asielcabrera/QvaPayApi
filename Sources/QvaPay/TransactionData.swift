//
//  File.swift
//  
//
//  Created by Asiel Cabrera on 1/14/21.
//

import Foundation

struct TransactionResponse: Codable {
    var current_page: Int
    var data: [Transaction]
    var first_page_url: String
    var from: Int
    var last_page: Int
    var last_page_url: String
    var next_page_url: String
    var path: String
    var per_page: Int
    var prev_page_url: String
    var to: Int
    var total: Int
}

struct Transaction: Codable {
    var uuid: String
    var user_id: String
    var app_id: String
    var amount: CGFloat
    var description: String
    var remote_id: String
    var status: String
    var paid_by_user: String
    var created_at: Date
    var update_at: Date
    var signed: String
    
}
