//
//  File.swift
//  
//
//  Created by Asiel Cabrera on 1/13/21.
//

import Foundation

public let credentials: Credentials = load("credentials.json")

public func load<T:Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("No se pudo encontrar \(filename) en el main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch{
        fatalError("No se puede cargar \(filename) en el main bundle: \n \(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("No se pudo parsear \(filename) como \(T.self): \n \(error)")
    }
}

public struct Credentials:  Codable, Hashable {
    public var app_id: String
    public var app_secrect: String
}


public func loadContentForLogin() -> NSDictionary?{
    var nsDic: NSDictionary?
    if let path = Bundle.main.path(forResource: "config", ofType: "plist"){
        nsDic = NSDictionary(contentsOfFile: path)
    }
    return nsDic
}
