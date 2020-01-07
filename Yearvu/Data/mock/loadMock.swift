//
//  loadMock.swift
//  Yearvu
//
//  Created by Thiago Ricieri on 31/12/19.
//  Copyright © 2019 Thiago Ricieri. All rights reserved.
//

import class Foundation.Bundle
import class Foundation.JSONDecoder
import struct Foundation.Data

let expenses: [Expense] = load("expenses.json")
let currencies = ["BRL", "USD", "EUR", "GBP"]

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
