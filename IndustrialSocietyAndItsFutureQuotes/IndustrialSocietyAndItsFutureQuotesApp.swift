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
    @State var quoteIndex = 0
    
    var body: some Scene {
        WindowGroup {
            ContentView(sentenceList: $sentenceList, quoteIndex: $quoteIndex)
        }
    }
}
