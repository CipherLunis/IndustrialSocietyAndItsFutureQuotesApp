//
//  ContentView.swift
//  IndustrialSocietyAndItsFutureQuotes
//
//  Created by Cipher Lunis on 12/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @Binding var sentenceList: [String]
    @Binding var quoteIndex: Int
    
    let isIPad = UIDevice.current.userInterfaceIdiom == .pad
    
    init(sentenceList: Binding<[String]>, quoteIndex: Binding<Int>) {
        self._sentenceList = sentenceList
        self._quoteIndex = .constant(Int.random(in: 0...sentenceList.count))
    }
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("BG")
                    .resizable()
                    .ignoresSafeArea()
                VStack {
                    Text("\"\(sentenceList[quoteIndex])\"")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .font(.system(size: isIPad ? 80 : 60))
                        .shadow(radius: 10)
                        .minimumScaleFactor(0.5)
                        .padding(.leading)
                        .padding(.trailing)
                        .kerning(0.8)
                    Spacer()
                    Button {
                        quoteIndex = Int.random(in: 0...sentenceList.count)
                    } label: {
                        Text("New Quote")
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .font(.system(size: isIPad ? 40 : 20))
                    }
                    .frame(width: geo.size.width/1.2, height: geo.size.height/16)
                    .background(.blue)
                    .cornerRadius(10)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(sentenceList: .constant(TextParserHelper.parseText()), quoteIndex: .constant(0))
    }
}
