//
//  PostView.swift
//  DotPagerSampleApp
//
//  Created by giiiita on 2020/02/12.
//  Copyright © 2020 giiiita. All rights reserved.
//

import SwiftUI
import DotPager
struct PostView: View {
    
    let images: [Image]
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("giiiita_icon")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 5.0))
                    .overlay(Circle().stroke(Color.orange, lineWidth: 2.0))
                    .padding(.leading)
                Text("giiiita")
                    .font(.system(size: 12))
                Spacer()
                Button(
                    action: {},
                    label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(Color.gray)
                            .padding(.trailing)
                    }
                )
            }
            DotPager(
            self.images,
            contentWidth: UIScreen.main.bounds.width,
            contentHeight: 300.0,
            contentMode: .fill,
            thresholdType: .harf) { image in
                image
            }
            .frame(width: UIScreen.main.bounds.width, height: 300)
            .padding(.vertical, 10.0)
            HStack(alignment: .center, spacing: 0) {
                Group {
                    Image(systemName: "heart")
                    Image(systemName: "bubble.right")
                    Image(systemName: "paperplane")
                }.padding(.leading)
                Spacer()
                Image(systemName: "bookmark")
                    .padding(.trailing)
            }.padding(.top, 5)
            Group {
                HStack(alignment: .center, spacing: 0) {
                    Text("giiiita").bold()
                    Text("さんが「いいね!」しました")
                    Spacer()
                }
                HStack(alignment: .center, spacing: 5) {
                    Text("giiiita").bold()
                    Text("sample Instargam Design")
                    Spacer()
                }
            }
            .font(.system(size: 12))
            .padding(.top, 5)
            .padding(.leading)
        }
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(images: [Image("sample_photo1"), Image("sample_photo2"),Image("sample_photo3"),Image("sample_photo4")])
    }
}
