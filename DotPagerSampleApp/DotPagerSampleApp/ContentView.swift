//
//  ContentView.swift
//  DotPagerSampleApp
//
//  Created by giiiita on 2020/02/12.
//  Copyright © 2020 giiiita. All rights reserved.
//

import SwiftUI
import DotPager

struct ContentView: View {
    
    let images: [Image]
    var body: some View {
        
        NavigationView {
            DotPager(
            self.images,
            contentWidth: UIScreen.main.bounds.width,
            contentHeight: 200.0,
            contentMode: .fill,
            thresholdType: .harf) { image in
                image
            }
        }
    }

}
//
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(images: [Image("sample_photo1"), Image("sample_photo2"),Image("sample_photo3"),Image("sample_photo4")])
    }
}
