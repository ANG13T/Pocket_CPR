//
//  ColorPickerView.swift
//  Pocket_CPR WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/29/22.
//

import SwiftUI

let squareSize: CGFloat = 10

// Our square
struct Square: View {
    var color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 0)
            .frame(width: squareSize, height: squareSize, alignment: .center)
            .foregroundColor(color)
    }
}


struct ColorPickerView: View {
    @Binding var isPresented: Bool
    let colors = [
        Color.red,
        Color.blue,
        Color.green,
        Color.yellow,
    ]
    
    // This will be our desired spacing we want for our grid
    // If you want the grid to be truly square you can just set this to 'squareSize'
    let spacingDesired: CGFloat = 25
    
    // These are our grid items we'll use in the 'LazyHGrid'
    let rows = [
        GridItem(.fixed(squareSize), spacing: 25, alignment: .center),
        GridItem(.fixed(squareSize), spacing: 25, alignment: .center)
    ]
    
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: spacingDesired, pinnedViews: [], content: {
            ForEach(0 ..< 4) { colorIndex in
                Square(color: colors[colorIndex])
            }
        })
    }
}


