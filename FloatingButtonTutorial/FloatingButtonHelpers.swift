//
//  FloatingButtonHelpers.swift
//  FloatingButtonDemo
//
//  Created by Alex Nagy on 18.01.2021.
//

import SwiftUI

struct MockData {
    
    static let mainButtonImage = "umbrella.fill"
    
    static let mainButtonColors = [
        "eb3b5a",
        "f7b731"
    ]

    static let colors = [
        "e84393",
        "0984e3",
        "6c5ce7",
        "00b894"
    ].map { Color(hex: $0) }

    static let iconImageNames = [
        "sun.max.fill",
        "cloud.fill",
        "cloud.rain.fill",
        "cloud.snow.fill"
    ]
    
}

struct MainButton: View {

    var imageName: String
    var colorHex: String

    var width: CGFloat = 50

    var body: some View {
        ZStack {
            Color(hex: colorHex)
                .frame(width: width, height: width)
                .cornerRadius(width/2)
                .shadow(color: Color(hex: colorHex).opacity(0.3), radius: 15, x: 0, y: 15)
            Image(systemName: imageName).foregroundColor(.white)
        }
    }
}

struct IconButton: View {

    var imageName: String
    var color: Color

    let imageWidth: CGFloat = 20
    let buttonWidth: CGFloat = 45

    var body: some View {
        ZStack {
            self.color

            Image(systemName: imageName)
                .frame(width: self.imageWidth, height: self.imageWidth)
                .foregroundColor(.white)
        }
        .frame(width: self.buttonWidth, height: self.buttonWidth)
        .cornerRadius(self.buttonWidth / 2)
    }
}

extension Color {
    
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(red: Double(r) / 0xff, green: Double(g) / 0xff, blue: Double(b) / 0xff)
    }
    
}

