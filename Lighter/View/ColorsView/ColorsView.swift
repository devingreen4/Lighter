//
//  ColorsView.swift
//  Lighter
//
//  Created by Devin Green on 7/26/20.
//  Copyright © 2020 Devin Green. All rights reserved.
//

import SwiftUI



struct ColorsView: View {
    @Binding var linkedLights: [Light]
    @State var colors : [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink,
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink,
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink,
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink,
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink
    ]
    
    func itemForCoordinates(x: Int, y: Int) -> some View{
        let index = (y * 6) + x
        
        return Group{
            if index < self.colors.count{
                BackgroundView(color: Color(self.colors[index]))
                    .onTapGesture {
                        for x in self.linkedLights.indices{
                            self.linkedLights[x].setColor(color: self.colors[index])
                        }
                }
            }else{
                BackgroundView(color: .clear)
            }
        }
        .aspectRatio(1, contentMode: .fill)
    }
    
    var body: some View {
        let columnCount = (self.colors.count / 6) + (self.colors.count % 6 == 0 ? 0 : 1)
        
        return VStack(alignment: .leading){
            Text("Colors")
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .padding(.horizontal, 25)
            
            VStack{
                ForEach(0..<columnCount, id: \.self){ y in
                    HStack{
                        ForEach(0..<6, id: \.self){ x in
                            self.itemForCoordinates(x: x, y: y)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    
}

struct ColorsView_Previews: PreviewProvider {
    static var previews: some View {
        ColorsView(linkedLights: .constant([]))
    }
}
