//
//  ButtonNonSelected.swift
//  NoonBody
//
//  Created by 윤진영 on 2020/10/12.
//

import SwiftUI

struct ButtonNonSelected: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0,
               maxWidth: .infinity)
            .padding()
            .foregroundColor(.gray)
//            .background(Color("primaryOrange"))

    }
}
