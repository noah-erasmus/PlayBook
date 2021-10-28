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
    @State var caption: String = "Write a caption..."
    @State var pickedImage: UIImage?
    @State var displayImage: Image?
    var body: some View {
        ZStack {
            Color("offwhite")
            ZStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 0 ) {
                        ZStack {
                            Color("white")
                                .shadow(radius: 5)
                            VStack(alignment: .leading, spacing: 0){
                                if displayImage != nil {
                                    displayImage!
                                        .resizable()
                                        .aspectRatio( contentMode: .fill)
                                        .frame(width: 350, height: 280, alignment: .trailing)
//                                        .onTapGesture(perform: {
//                                            self.showingActionSheet = true
//                                        })
                                } else {
                                    Image("placeholder")
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio( contentMode: .fill)
                                    .frame(width: 350, height: 280, alignment: .trailing)
//                                    .onTapGesture(perform: {
//                                        self.showingActionSheet = true
//                                    })
                                }
                                TextEditor(text: $caption)
                                    .font(.system(size: 10))
                                    .opacity(40)
                                    .padding(.leading, 30)
                                    .padding(.top, 10)
                                Spacer()

                            }
                        }
                        .frame(width: .infinity, height: 380)
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
                            .padding(.leading, 35)
                        }
                        .frame(width: .infinity, height: 45)
                        .padding(.top, 10)
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
                            .padding(.leading, 35)
                        }
                        .frame(width: .infinity, height: 45)
                        .padding(.top, 10)

                    }
                    .frame(width: .infinity)

                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
//                            UploadImage()
                        }, label: {
                            Text("+")
                                .font(.system(.largeTitle))
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 7)
                        })
                        .background(Color("lightPurple"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                }
            }

        }
        .navigationBarTitle("New Post", displayMode: .inline)
        .navigationBarHidden(false)
//        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
//            ImagePicker(pickedImage: $pickedImage)
//        }.actionSheet(isPresented: $showingActionSheet) {
//            ActionSheet(title: Text(""), buttons: [.default(Text("Choose an image")) {
//                self.sourceType = .photoLibrary
//                self.showingImagePicker = true
//            }, .default(Text("Take a photo")) {
//                self.sourceType = .camera
//                self.showingImagePicker = true
//            }, .cancel()])
        }
    }

