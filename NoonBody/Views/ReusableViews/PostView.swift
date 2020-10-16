//
//  PostView.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/16.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        
        VStack{
            Image(systemName: "heart")
                .frame(height: 300)
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95).opacity(0.6))
            VStack {
                HStack{
                    Image(systemName: "heart")
                    Image(systemName: "envelope")
                    Spacer()
                    Image(systemName: "bookmark")
                }
                
                HStack{
                    Text("poster")
                    Spacer()
                }.font(.system(size: 12, weight: .bold))
                HStack{
                    Text("description")
                    Spacer()
                }.font(.system(size: 12, weight: .regular))
            }.padding()
            .background(Color.orange)
            
            
        }.background(Color.yellow)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}