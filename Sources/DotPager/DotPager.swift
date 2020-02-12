//
//  DotPager.swift
//
//  Created by giiiita on 2020/02/12.
//  Copyright © 2020 giiiita. All rights reserved.
//

import SwiftUI

public struct DotPager<Content>: View where Content: View {
    
    @State private var index: Int = 0
    @State private var offset: CGFloat = 0.0
    
    public enum ThresholdType {
        case harf
        case quarter
        
        func getSize(value: CGFloat) ->CGFloat {
            switch self {
            case .harf: return value / 2
            case .quarter: return value / 2
            }
        }
    }
    
    private let data: [Image]
    private let content: (Image) -> Content
    private let contentWidth: CGFloat
    private let contentHeight: CGFloat
    private let contentMode: ContentMode
    private let thresholdType: ThresholdType
    private let normalColor: Color
    private let selectedColor: Color
    
    public init(_ data: [Image],
                contentWidth: CGFloat,
                contentHeight: CGFloat,
                contentMode: ContentMode = .fill,
                thresholdType: ThresholdType = .harf,
                normalColor: Color = Color.gray,
                selectedColor: Color = Color.black,
                content: @escaping (Image) -> Content) {
        self.data = data.map { $0 }
        self.content = content
        self.contentWidth = contentWidth
        self.contentHeight = contentHeight
        self.contentMode = contentMode
        self.thresholdType = thresholdType
        self.normalColor = normalColor
        self.selectedColor = selectedColor
    }
    
    public var body : some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(0..<self.data.count) {
                            self.content(self.data[$0].resizable())
                                .frame(width: self.contentWidth, height: self.contentHeight)
                                .aspectRatio(contentMode: self.contentMode)
                        }
                    }
                }
                .content.offset(x: self.offset)
                .frame(width: geometry.size.width, height: self.contentHeight, alignment: .leading)
                .gesture(DragGesture()
                    .onChanged({ value in
                          if self.index == self.data.endIndex - 1 && value.translation.width < 0 { return }
                          if self.index == 0 && value.translation.width > 0 { return }
                          self.offset = value.translation.width - geometry.size.width * CGFloat(self.index)
                      })
                    .onEnded({ value in
                        if value.predictedEndTranslation.width < -self.thresholdType.getSize(value: geometry.size.width) {
                            self.index = min(self.index + 1, self.data.endIndex - 1)
                        } else if value.predictedEndTranslation.width > self.thresholdType.getSize(value: geometry.size.width) {
                            self.index = max(self.index - 1, 0)
                        }
                        
                        withAnimation {
                            self.offset = -geometry.size.width * CGFloat(self.index)
                        }
                    })
                )
                PageControlView(
                    elementCount: self.data.count,
                    normalColor: self.normalColor,
                    selectedColor: self.selectedColor,
                    index: self.$index
                )
            }
        }
    }
}

private struct PageControlView: View {
    
    var elementCount: Int
    var normalColor: Color
    var selectedColor: Color
    @Binding var index: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: 2.0) {
            ForEach(0..<self.elementCount) { index in
                Circle().frame(width: 10, height: 10)
                    .foregroundColor((self.index == index) ?  self.selectedColor : self.normalColor)
            }
        }
    }
}
