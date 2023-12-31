//
//  StrokedText.swift
//  IndustrialSocietyAndItsFutureQuotes
//
//  Created by Cipher Lunis on 12/30/23.
//

import UIKit
import SwiftUI

struct StrokedText: UIViewRepresentable {

    private var strokeColor: UIColor
    private var fillColor: UIColor
    private var fontSize: CGFloat
    private var fontName: String
    private var strokeWidth: CGFloat
    private var text: String
    
    init(strokeColor: UIColor, fillColor: UIColor, fontSize: CGFloat, fontName: String, strokeWidth: CGFloat, text: String) {
        self.strokeColor = strokeColor
        self.fillColor = fillColor
        self.fontSize = fontSize
        self.fontName = fontName
        self.strokeWidth = strokeWidth
        self.text = text
    }
    
    static func createStrokedAttributedString(text: String, strokeWidth: CGFloat, strokeColor: UIColor, fillColor: UIColor, fontName: String, fontSize: CGFloat) -> NSAttributedString {
        let attributedStringParagraphStyle = NSMutableParagraphStyle()
        attributedStringParagraphStyle.alignment = .center
        attributedStringParagraphStyle.lineSpacing = 10
        
        let attributedString = NSAttributedString(string: text, attributes: [
            NSAttributedString.Key.paragraphStyle : attributedStringParagraphStyle,
            NSAttributedString.Key.strokeWidth : strokeWidth,
            NSAttributedString.Key.strokeColor : strokeColor,
            NSAttributedString.Key.foregroundColor : fillColor,
            NSAttributedString.Key.font : UIFont(name: fontName, size: fontSize)!
        ])
        
        return attributedString
    }
    
    func makeUIView(context: Context) -> UILabel {
        let attributedString = StrokedText.createStrokedAttributedString(text: text, strokeWidth: strokeWidth, strokeColor: strokeColor, fillColor: fillColor, fontName: fontName, fontSize: fontSize)
        
        let strokeLabel = UILabel()
        strokeLabel.attributedText = attributedString
        strokeLabel.minimumScaleFactor = 0.5
        strokeLabel.adjustsFontSizeToFitWidth = true
        strokeLabel.numberOfLines = 0
        strokeLabel.lineBreakMode = .byTruncatingTail
        strokeLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        strokeLabel.textAlignment = .center
        
        return strokeLabel
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = self.text
    }
}
