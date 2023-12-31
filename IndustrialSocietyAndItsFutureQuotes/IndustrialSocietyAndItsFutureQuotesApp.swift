//
//  IndustrialSocietyAndItsFutureQuotesApp.swift
//  IndustrialSocietyAndItsFutureQuotes
//
//  Created by Cipher Lunis on 12/30/23.
//

import SwiftUI

@main
struct IndustrialSocietyAndItsFutureQuotesApp: App {
    
    @State var sentenceList = TextParserHelper.parseText()
    
    var body: some Scene {
        WindowGroup {
            ContentView(sentenceList: $sentenceList)
        }
    }
}
