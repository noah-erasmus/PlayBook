//
//  NewPostView.swift
//  PlayBook
//
//  Created by Noah Erasmus on 2021/10/07.
//

//import SwiftUI
//
//struct NewPostView: View {
//
//    @State var caption: String = "Write a caption..."
//    @State var pickedImage: UIImage?
//    @State var displayImage: Image?
//
//    @State var errorMessage = ""
//    @State var showingAlert = false
//    @State var errorTitle = "Oops!"
//
//    @State var showingActionSheet = false
//    @State var showingImagePicker = false
//    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
//
//    func loadImage() {
//        guard let inputImage = pickedImage else {return}
//        pickedImage = inputImage
//        displayImage = Image(uiImage: inputImage)
//    }
//
//    func errorCheck() -> String? {
//        if caption.trimmingCharacters(in: .whitespaces).isEmpty || pickedImage == nil {
//            return "Please upload an image with a caption"
//        }
//        return nil
//    }
//
//    func clear(){
//        self.displayImage = nil
//        self.caption = ""
//    }
//
//    func UploadImage(){
//        if let error = errorCheck() {
//            self.errorMessage =  error
//            self.showingAlert = true
//            return
//        }
//
//        StorageService.savePost(caption: caption, image: self.pickedImage!, onSuccess: {
//            self.clear()
//        }, onError: {
//            (errorMessage) in
//            self.errorMessage = errorMessage
//            self.showingAlert = true
//            return
//        })
//    }
//
//    let lightPurple = UIColor(red: 107/255, green: 70/255, blue: 246/255, alpha: 1.0)
//
//    init() {
//      let coloredAppearance = UINavigationBarAppearance()
//      coloredAppearance.configureWithOpaqueBackground()
//      coloredAppearance.backgroundColor = lightPurple
//      coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
//      coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
//
//      UINavigationBar.appearance().standardAppearance = coloredAppearance
//      UINavigationBar.appearance().compactAppearance = coloredAppearance
//      UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
//
//      UINavigationBar.appearance().tintColor = .white
//    }
//
//    var body: some View {
//            ZStack {
//                Color("offwhite")
//                ZStack {
//                    ScrollView {
//                        VStack(alignment: .leading, spacing: 0 ) {
//                            ZStack {
//                                Color("white")
//                                    .shadow(radius: 5)
//                                VStack(alignment: .leading, spacing: 0){
//                                    if displayImage != nil {
//                                        displayImage!
//                                            .resizable()
//                                            .aspectRatio( contentMode: .fill)
//                                            .frame(width: 350, height: 280, alignment: .trailing)
//                                            .onTapGesture(perform: {
//                                                self.showingActionSheet = true
//                                            })
//                                    } else {
//                                        Image("placeholder")
//                                        .renderingMode(.original)
//                                        .resizable()
//                                        .aspectRatio( contentMode: .fill)
//                                        .frame(width: 350, height: 280, alignment: .trailing)
//                                        .onTapGesture(perform: {
//                                            self.showingActionSheet = true
//                                        })
//                                    }
//                                    TextEditor(text: $caption)
//                                        .font(.system(size: 10))
//                                        .opacity(40)
//                                        .padding(.leading, 30)
//                                        .padding(.top, 10)
//                                    Spacer()
//
//                                }
//                            }
//                            .frame(width: .infinity, height: 380)
//                            ZStack {
//                                Color("white")
//                                    .shadow(radius: 5)
//                                HStack {
//                                    Image(systemName: "tag.fill")
//                                        .foregroundColor(Color("lightPurple"))
//                                    Text("Tag People")
//                                        .font(.system(size: 14))
//                                    Spacer()
//                                }
//                                .padding(.leading, 35)
//                            }
//                            .frame(width: .infinity, height: 45)
//                            .padding(.top, 10)
//                            ZStack {
//                                Color("white")
//                                    .shadow(radius: 5)
//                                HStack {
//                                    Image(systemName: "gamecontroller.fill")
//                                        .foregroundColor(Color("lightPurple"))
//                                    Text("Add Game")
//                                        .font(.system(size: 14))
//                                    Spacer()
//                                }
//                                .padding(.leading, 35)
//                            }
//                            .frame(width: .infinity, height: 45)
//                            .padding(.top, 10)
//
//                        }
//                        .frame(width: .infinity)
//
//                    }
//                    VStack {
//                        Spacer()
//                        HStack {
//                            Spacer()
//                            Button(action: {
//                                UploadImage()
//                            }, label: {
//                                Text("+")
//                                    .font(.system(.largeTitle))
//                                    .frame(width: 77, height: 70)
//                                    .foregroundColor(Color.white)
//                                    .padding(.bottom, 7)
//                            })
//                            .background(Color("lightPurple"))
//                            .cornerRadius(38.5)
//                            .padding()
//                            .shadow(color: Color.black.opacity(0.3),
//                                    radius: 3,
//                                    x: 3,
//                                    y: 3)
//                        }
//                    }
//                }
//
//            }
//            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//                ImagePicker(pickedImage: $pickedImage)
//            }.actionSheet(isPresented: $showingActionSheet) {
//                ActionSheet(title: Text(""), buttons: [.default(Text("Choose an image")) {
//                    self.sourceType = .photoLibrary
//                    self.showingImagePicker = true
//                }, .default(Text("Take a photo")) {
//                    self.sourceType = .camera
//                    self.showingImagePicker = true
//                }, .cancel()])
//            }
//            .navigationBarTitle("New Post", displayMode: .inline)
//            .navigationBarHidden(false)
//
//    }
//
//
//}
//
//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}

// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------
// --------------------------------------------------------------------------------------------------------------------------------------------------------

import SwiftUI

struct NewPostView: View {
    
    //Variables
    @StateObject var newPostData = NewPostModel()
    @State var pickedImage: UIImage?
    @State var displayImage: Image?
    @Environment(\.presentationMode) var present
    
    var body: some View {
        ZStack {
            //Background
            Color("offwhite")
            
            ScrollView {
                
                ZStack {
                    
                    Color("white")
                    
                    VStack {
                        if newPostData.imgData.count != 0 {
                            //Selected image
                            Image(uiImage: UIImage(data: newPostData.imgData)!)
                                .resizable()
                                .aspectRatio( contentMode: .fill)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                                .onTapGesture(perform: {
                                    newPostData.picker.toggle()
                                })
                        } else {
                            //Placeholder
                            Image("placeholder")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio( contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 400)
                            .onTapGesture(perform: {
                                newPostData.picker.toggle()
                            })
                        }
                        
                        HStack{
                            TextEditor(text: $newPostData.postTxt)
                                .font(.system(size: 10))
                                .opacity(40)
                                .padding(.leading, 100)
//                                .padding(.top, 10)
                                .foregroundColor(.black)
                        }
                        .frame(height: 100)
                    }
                }
                
                ZStack {
                    Color("white")
                        .shadow(radius: 5)
                    HStack {
                        Image(systemName: "tag.fill")
                            .foregroundColor(Color("lightPurple"))
                        Text("Tag People")
                            .font(.system(size: 14))
                        Spacer()
                    }
                    .padding(.leading, 110)
                }
                .frame(height:60)
//                .frame(maxWidth: .infinity)
                ZStack {
                    Color("white")
                        .shadow(radius: 5)
                    HStack {
                        Image(systemName: "gamecontroller.fill")
                            .foregroundColor(Color("lightPurple"))
                        Text("Add Game")
                            .font(.system(size: 14))
                        Spacer()
                    }
                    .padding(.leading, 110)
                }
                .frame(height:60)
//                .frame(maxWidth: .infinity)
                
//                VStack(alignment: .leading, spacing: 0 ) {
//                    ZStack {
//                        //Edit background
//                        Color("white")
//                            .shadow(radius: 5)
//
//                        //Image and caption input
//                        VStack(alignment: .leading, spacing: 0){
//
//                            VStack {
//                                //Check if an image has been selected
//                                if newPostData.imgData.count != 0 {
//                                    //Selected image
//                                    Image(uiImage: UIImage(data: newPostData.imgData)!)
//                                        .resizable()
//                                        .aspectRatio( contentMode: .fill)
//                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
//                                        .onTapGesture(perform: {
//                                            newPostData.picker.toggle()
//                                        })
//                                } else {
//                                    //Placeholder
//                                    Image("placeholder")
//                                    .renderingMode(.original)
//                                    .resizable()
//                                    .aspectRatio( contentMode: .fill)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
//                                    .onTapGesture(perform: {
//                                        newPostData.picker.toggle()
//                                    })
//                                }
//                            }
//                            .frame(maxWidth: .infinity, maxHeight: 400)
//
//                            //Caption
//                            HStack{
//                                TextEditor(text: $newPostData.postTxt)
//                                    .font(.system(size: 10))
//                                    .opacity(40)
//                                    .padding(.leading, 30)
//                                    .padding(.top, 10)
//                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//                                Spacer()
//                            }
//                            .frame(maxWidth: .infinity, maxHeight: 200)
//
//                        }
//                        .frame(maxWidth: .infinity, maxHeight: 450)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: 500)
//                    ZStack {
//                        Color("white")
//                            .shadow(radius: 5)
//                        HStack {
//                            Image(systemName: "tag.fill")
//                                .foregroundColor(Color("lightPurple"))
//                            Text("Tag People")
//                                .font(.system(size: 14))
//                            Spacer()
//                        }
//                        .padding(.leading, 35)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: 45)
//                    .padding(.top, 10)
//                    ZStack {
//                        Color("white")
//                            .shadow(radius: 5)
//                        HStack {
//                            Image(systemName: "gamecontroller.fill")
//                                .foregroundColor(Color("lightPurple"))
//                            Text("Add Game")
//                                .font(.system(size: 14))
//                            Spacer()
//                        }
//                        .padding(.leading, 35)
//                    }
//                    .frame(maxWidth: .infinity, maxHeight: 45)
//                    .padding(.top, 10)
//
//                }
//                .frame(maxWidth: .infinity)

            }

        }
        .opacity(newPostData.isPosting ? 0.5 : 1)
        .disabled(newPostData.isPosting ? true : false)
        .navigationBarTitle("New Post", displayMode: .inline)
        .navigationBarHidden(false)
        .toolbar {
            NavigationLink(
                destination: FeedView()
                    .navigationTitle("Feed")
                    .toolbar {
                        NavigationLink(
                            destination: NewPostView()
                                .navigationBarTitle("New Post", displayMode: .inline),
                            label: {
                                Image(systemName: "slider.horizontal.3")
                            }
                        )
                    },
                label: {
                    Button(action: {newPostData.post(present: present)}){
                        Image(systemName: "checkmark")
                    }
                }
            )
        }
        .sheet(isPresented: $newPostData.picker) {
            ImagePicker(picker: $newPostData.picker, imgData: $newPostData.imgData)
        }
        //.actionSheet(isPresented: $showingActionSheet) {
//            ActionSheet(title: Text(""), buttons: [.default(Text("Choose an image")) {
//                self.sourceType = .photoLibrary
//                self.showingImagePicker = true
//            }, .default(Text("Take a photo")) {
//                self.sourceType = .camera
//                self.showingImagePicker = true
//            }, .cancel()])
        }
    }

