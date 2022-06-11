//
//  Slideshow.swift
//  CPR_Buddy WatchKit Extension
//
//  Created by Angelina Tsuboi on 6/11/22.
//

import SwiftUI

// MARK: - Dot Indicator -
struct DotIndicator: View {
    let minScale: CGFloat = 1
    let maxScale: CGFloat = 1.1
    let minOpacity: Double = 0.6
    
    let pageIndex: Int
    @Binding var slectedPage: Int
    
    var body: some View {
        
        Button(action: {
            self.slectedPage = self.pageIndex
        }) {
            Circle()
                .scaleEffect(
                    slectedPage == pageIndex
                        ? maxScale
                        : minScale
            )
                .animation(.spring())
                .foregroundColor(
                    slectedPage == pageIndex
                        ? Color.black
                        : Color.black.opacity(minOpacity)
            )
        }
        
    }
}

// MARK: - Page Indicator -
struct PageIndicator: View {
    // Constants
    private let spacing: CGFloat = 2
    private let diameter: CGFloat = 8
    
    // Settings
    let numPages: Int
    @Binding var selectedIndex: Int
    
    init(numPages: Int, currentPage: Binding<Int>) {
        self.numPages = numPages
        self._selectedIndex = currentPage
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: spacing) {
                ForEach((0..<numPages)) {
                    DotIndicator(
                        pageIndex: $0,
                        slectedPage: self.$selectedIndex
                    ).frame(
                        width: self.diameter,
                        height: self.diameter
                    )
                }
            }
        }
    }
}


// MARK: - Previews -
struct DotIndicator_Previews: PreviewProvider {
    static var previews: some View {
        DotIndicator(pageIndex: 0, slectedPage: .constant(0))
            .previewLayout(.fixed(width: 200, height: 200))
            .previewDisplayName("Hello")
    }
}

struct PageIndicator_Previews: PreviewProvider {
    static var previews: some View {
        PageIndicator(numPages: 5, currentPage: .constant(2))
            .previewDisplayName("Regular")
            .previewLayout(PreviewLayout.sizeThatFits)
            .padding()
    }
}
