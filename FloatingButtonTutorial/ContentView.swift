//
//  ContentView.swift
//  FloatingButtonTutorial
//
//  Created by Alex Nagy on 21.01.2021.
//

import SwiftUI
import FloatingButton
import NavigationKit

struct ContentView: View {
    
    @EnvironmentObject var navigation: Navigation
    
    @State var isOpen = false
    
    var body: some View {
        
        let mainButton = AnyView(
            MainButton(imageName: MockData.mainButtonImage, colorHex: isOpen ? MockData.mainButtonColors[0] : MockData.mainButtonColors[1])
        )
        
        let buttonsImage = (0..<MockData.iconImageNames.count).map { i in
            AnyView(
                IconButton(imageName: MockData.iconImageNames[i], color: MockData.colors[i]).onTapGesture {
                    navigation.push(IconButton(imageName: MockData.iconImageNames[i], color: MockData.colors[i]).onTapGesture {
                        navigation.pop()
                    })
                }
            )
        }
        
        let menu1 = FloatingButton(mainButtonView: mainButton, buttons: buttonsImage, isOpen: $isOpen)
            .straight()
            .direction(.right)
            .delays(delayDelta: 0.1)
        
        let menu2 = FloatingButton(mainButtonView: mainButton, buttons: buttonsImage)
            .straight()
            .direction(.bottom)
        
        let menu3 = FloatingButton(mainButtonView: mainButton, buttons: buttonsImage.dropLast())
            .circle()
            .startAngle(3/2 * .pi)
            .endAngle(2 * .pi)
            .radius(70)
            .delays(delayDelta: 0.1)
            .initialScaling(0.3)
            .initialOpacity(0.3)
        
        let menu4 = FloatingButton(mainButtonView: mainButton, buttons: buttonsImage)
            .circle()
            .delays(delayDelta: 0.1)
            .startAngle(2 * .pi)
            .endAngle(1 * .pi)
        
        return VStack {
            HStack {
                menu1.padding(20)
                Spacer().layoutPriority(1)
                menu2.padding(20)
            }
            Spacer().layoutPriority(1)
            HStack {
                menu3.padding(20)
                Spacer().layoutPriority(1)
                menu4.padding(20)
                Spacer().layoutPriority(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
