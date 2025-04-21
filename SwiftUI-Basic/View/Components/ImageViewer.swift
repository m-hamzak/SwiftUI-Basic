//
//  ImageViewer.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 17/04/2025.
//

import SwiftUI
import SwiftUI

struct ImageViewer: View {
    let uiImages: [UIImage]
    
    @State private var comment: String = ""
    @State private var savedComment: String? = nil
    @State private var showEditOptions: Bool = false
    @State private var scale: CGFloat = 1.0
    @GestureState private var gestureScale: CGFloat = 1.0
    @State private var selectedImages: Set<Int> = []
    @Environment(\.dismiss) private var dismiss
    
    var isMultiPhotoMode: Bool {
        uiImages.count > 1
    }
    
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
                .onTapGesture { hideKeyboard() }

            VStack(spacing: 0) {
                topBar
                    .padding(.horizontal)
                    .padding(.top, 12)
                
                if isMultiPhotoMode {
                    multiPhotoView
                } else {
                    singlePhotoView
                }
            }

            // Save Button – Always bottom-right
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        savedComment = comment
                    }) {
                        Text("Save")
                            .bold()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.gray)
                    .padding(.trailing)
                    .padding(.bottom, 16)
                }
            }
        }
        .navigationBarHidden(true)
    }

    // MARK: - Single Photo View
    private var singlePhotoView: some View {
        GeometryReader { geometry in
            VStack {
                Image(uiImage: uiImages.first!)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
                    .scaleEffect(scale * gestureScale)
                    .gesture(
                        MagnificationGesture()
                            .updating($gestureScale) { value, state, _ in
                                state = value
                            }
                            .onEnded { value in
                                scale = min(max(scale * value, 1.0), 4.0)
                            }
                    )
                    .frame(maxWidth: geometry.size.width * 0.95)

                Spacer()
                commentSection
                
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
    }

    // MARK: - Multi Photo Grid View
    private var multiPhotoView: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 90), spacing: 10)], spacing: 10) {
                ForEach(uiImages.indices, id: \.self) { index in
                    ZStack(alignment: .topTrailing) {
                        Image(uiImage: uiImages[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                            .cornerRadius(10)

                        if showEditOptions {
                            Button(action: {
                                if selectedImages.contains(index) {
                                    selectedImages.remove(index)
                                } else {
                                    selectedImages.insert(index)
                                }
                            }) {
                                Image(systemName: selectedImages.contains(index) ? "checkmark.circle.fill" : "circle")
                                    .foregroundColor(selectedImages.contains(index) ? .blue : .gray)
                                    .font(.system(size: 22))
                                    .padding(6)
                            }
                        }
                    }
                }

                // Add more button
                Button(action: {
                    // Handle image import
                }) {
                    VStack {
                        Image(systemName: "plus.circle")
                            .font(.largeTitle)
                        Text("Add More")
                            .font(.subheadline)
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)
            .padding(.top)
        }
    }

    // MARK: - Comment Section (single photo only)
    private var commentSection: some View {
        HStack(spacing: 80) {
            TextField("Add a comment ...", text: $comment)
                .textFieldStyle(.roundedBorder)
                .padding([.horizontal, .bottom])
                .frame(minHeight: 50)
            Spacer()
        }
    }

    // MARK: - Top Bar
    private var topBar: some View {
        HStack {
            Button(action: { dismiss() }) {
                Image(systemName: "xmark")
                    .font(.headline)
                    .padding(3)
                    .foregroundStyle(.gray)
            }
            .buttonStyle(.bordered)
            .clipShape(Circle())

            Spacer()

            HStack(spacing: 8) {
                if isMultiPhotoMode {
                    Button(action: {
                        withAnimation {
                            showEditOptions.toggle()
                            if !showEditOptions {
                                selectedImages.removeAll()
                            }
                        }
                    }) {
                        Text("Select")
                            .bold()
                    }
                    .buttonStyle(.bordered)
                    .tint(.gray)
                } else {
                    if showEditOptions {
                        Button(action: {}) {
                            Image(systemName: "crop")
                                .font(.subheadline)
                        }
                        Button(action: {}) {
                            Image(systemName: "pencil.tip")
                                .font(.subheadline)
                        }
                    }

                    Button(action: {
                        withAnimation {
                            showEditOptions.toggle()
                        }
                    }) {
                        Image(systemName: "pencil")
                            .font(.headline)
                            .padding(3)
                            .foregroundStyle(.gray)
                    }
                    .buttonStyle(.bordered)
                    .clipShape(Circle())
                }
            }
        }
    }

    // MARK: - Keyboard Dismiss
    private func hideKeyboard() {
#if canImport(UIKit)
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
#endif
    }
}

struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ImageViewer(uiImages: [UIImage(named: "profile-image") ?? UIImage()])
            }
            NavigationView {
                ImageViewer(uiImages: [
                    UIImage(named: "profile-image") ?? UIImage(),
                    UIImage(named: "profile-image") ?? UIImage()
                ])
            }
        }
    }
}



