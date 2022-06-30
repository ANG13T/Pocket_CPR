//
//  ColorPickerView.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/29/22.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var isPresented: Bool
    @Binding var selection: Color

        var body: some View {

            let colors = [
                Color.red,
                Color.blue,
                Color.green,
                Color.gray,
                Color.orange,
                Color.yellow,
                Color.purple,
                Color.cyan,
                Color.indigo,
                Color.mint,
                Color.pink
            ]

            let columns = [
                GridItem(.adaptive(minimum: 60))
            ]

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(colors, id: \.self){ color in
                    ZStack {
                        Circle()
                            .fill(Color(color))
                            .frame(width: 50, height: 50)
                            .onTapGesture(perform: {
                                selection = color
                            })
                            .padding(10)

                        if selection == color {
                            Circle()
                                .stroke(Color(color), lineWidth: 5)
                                .frame(width: 60, height: 60)
                        }
                    }
                }
            }
            .padding(10)
        }
}


