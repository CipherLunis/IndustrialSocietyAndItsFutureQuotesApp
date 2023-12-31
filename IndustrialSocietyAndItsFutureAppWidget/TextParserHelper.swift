//
//  IndustrialSocietyAndItsFutureViewModel.swift
//  IndustrialSocietyAndItsFutureQuotes
//
//  Created by Cipher Lunis on 12/30/23.
//

import Foundation

struct TextParserHelper {
    
    static func parseText() -> [String] {
        if let path = Bundle.main.path(forResource: "IndustrialSocietyAndItsFutureText", ofType: ".txt") {
            do {
                let data = try! String(contentsOfFile: path, encoding: .utf8)
                var textParts = data.components(separatedBy: ["."])
                textParts = textParts.map({ $0.trimmingCharacters(in: ["\n", " ", ")", "(", ","]) })
                textParts = textParts.filter({ !$0.isNumber })
                textParts = textParts.filter({ $0.count > 10 && $0.count < 100 })
                return textParts
            }
        }
        
        return []
    }
}
