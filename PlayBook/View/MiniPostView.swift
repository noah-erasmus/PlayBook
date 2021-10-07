//
//  MiniPostView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/29.
//

import SwiftUI

struct MiniPostView: View {
    var body: some View {
        ZStack {
            Color("white")
                .shadow(radius: 5)
            VStack(alignment: .trailing, spacing: 0) {
                HStack {
                    Image("theLegend")
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(50)
                        .frame(width: 50, height: 50, alignment: .center)
                    VStack(alignment: .leading) {
                        Text("TheLegend27")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                        Text("45 minutes ago")
                            .font(.system(size: 14))
                    }
                    .padding(.trailing, 120)
                }
                .frame(width: .infinity, height: .infinity, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                Image("leagueCap")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(10)
                    .frame(width: .infinity, height: 130, alignment: .leading)
                HStack {
                    Image(systemName: "suit.heart")
                    Text("152")
                        .font(.system(size: 12))
                    Image(systemName: "bubble.right")
                    Text("24")
                        .font(.system(size: 12))
                }
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 110))
                Text("EZ game crushing n00bs in the midlane. #road2diamond")
                    .font(.system(size: 14))
                    .frame(width: 250)
            }
            .padding()
        }
        .frame(width: .infinity, height: .infinity, alignment: .leading)
    }
}

struct MiniPostView_Previews: PreviewProvider {
    static var previews: some View {
        MiniPostView()
            .previewLayout(.sizeThatFits)
    }
}
