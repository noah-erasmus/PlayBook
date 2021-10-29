//
//  MiniPostView.swift
//  PlayBook
//
//  Created by Caitie on 2021/09/29.
//

//import SwiftUI
//
//var dummyPost = Post(
//    postId: "1",
//    image: "https://dogtime.com/assets/uploads/2011/03/puppy-development.jpg",
//    caption: "caption",
//    date: 0,
//    likes: 0,
//    ownerId: "1"
//)
//
//extension String {
//    func loadImage() -> UIImage {
//        do {
//            guard let url = URL(string: self) else {
//                return UIImage()
//            }
//
//            let data: Data = try Data(contentsOf: url)
//
//            return UIImage(data: data) ?? UIImage()
//        }catch {
//            return UIImage()
//        }
//    }
//}
//
//struct MiniPostView: View {
//
//    var post: Post
//
//    @AppStorage("userId") var userId: String = ""
//
//    var body: some View {
//        ZStack {
//            Color("white")
//                .shadow(radius: 5)
//            VStack(alignment: .trailing, spacing: 0) {
//                HStack {
//                    Image("theLegend")
//                        .renderingMode(.original)
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(50)
//                        .frame(width: 50, height: 50, alignment: .center)
//                    VStack(alignment: .leading) {
//                        Text(post.ownerId)
//                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                            .font(.system(size: 16))
//                        Text("45 minutes ago")
//                            .font(.system(size: 14))
//                    }
//                    .padding(.trailing, 120)
//                }
//                .frame(width: .infinity, height: .infinity, alignment: .leading)
//                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
//                Image("leagueCap")
//                    .renderingMode(.original)
//                    .resizable()
//                    .scaledToFit()
//                    .cornerRadius(10)
//                    .frame(width: .infinity, height: 130, alignment: .leading)
//                HStack {
//                    Image(systemName: "suit.heart")
//                    Text("152")
//                        .font(.system(size: 12))
//                    Image(systemName: "bubble.right")
//                    Text("24")
//                        .font(.system(size: 12))
//                }
//                .padding(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 110))
//                Text(post.caption)
//                    .font(.system(size: 14))
//                    .frame(width: 250)
//            }
//            .padding()
//        }
//        .frame(width: .infinity, height: .infinity, alignment: .leading)
//    }
//}
//
//struct MiniPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        MiniPostView(post: dummyPost)
//    }
//}

// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------

import SwiftUI
import SDWebImageSwiftUI
import Foundation

struct MiniPostView: View {
    var post: Post
    @State var isLiked = false
    
    func getDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }

    var body: some View {
        ZStack {
            //Background
            Color("white")
                .shadow(radius: 5)
            
            VStack(alignment: .trailing, spacing: 0) {
                //Post details
                HStack {
                    //User image
                    AsyncImage(url: URL(string: post.owner.imageUrl)){image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                    
                    //Username and post time
                    VStack(alignment: .leading) {
                        Text(post.owner.userName)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                        Text(getDate(date: post.time))
                            .font(.system(size: 14))
                    }
                    .padding(.trailing, 120)
                }
                .frame(maxWidth: .infinity, maxHeight: 60, alignment: .leading)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                
                //Post image
                AsyncImage(url: URL(string: post.image)){image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(10)
                .frame(maxWidth: .infinity, maxHeight: 400, alignment: .leading)
                
                //Likes and comments
                HStack {
                    //Likes
                    if isLiked {
                        Button(action: {
                            isLiked = false
                        }){
                            Image(systemName: "heart.fill")
                        }
                    } else {
                        Button(action: {
                            isLiked = true
                        }){
                            Image(systemName: "heart")
                        }
                    }
                    Text("152")
                        .font(.system(size: 12))
                    
                    //Comments
                    Image(systemName: "bubble.right")
                    Text("0")
                        .font(.system(size: 12))
                    
                    Spacer()
                }
                .padding(EdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 0))
                
                //Post caption
                HStack {
                    Text(post.caption)
                        .font(.system(size: 14))
                        .frame(maxWidth: .infinity)
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
        }
        .frame(maxWidth: 500, maxHeight: .infinity, alignment: .leading)
    }
}
