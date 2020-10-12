//
//  NoonBodyTab.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct NoonBodyTab: View {
    
    init(){
            UITableView.appearance().backgroundColor = .clear
        }
    
    @State private var index = 0
    var contents = ["비교하기", "모아보기"]

    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $index, label: Text("")) {
                    ForEach(0..<contents.count) { index in
                        Text(self.contents[index]).tag(index)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
                Form{
                    if index == 0{
                        CompareView()
                    }else{
                        CollectionView()
                    }
                    
                }

                    
            }.background(Color("secondaryOrange"))
            .navigationTitle("눈바디")
        }
    }
}

struct NoonBodyTab_Previews: PreviewProvider {
    static var previews: some View {
        NoonBodyTab()
    }
}