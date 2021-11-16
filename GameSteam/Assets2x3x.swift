//
//  Assets2x3x.swift
//  GameSteam
//
//  Created by José Flores on 3/11/21.
//

import SwiftUI

struct Assets2x3x: View {
    var body: some View {
        GeometryReader(content: {geometry in
            VStack{
                Image("dest")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width/2 , height: geometry.size.height/3)
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

struct Assets2x3x_Previews: PreviewProvider {
    static var previews: some View {
        Assets2x3x()
    }
}
