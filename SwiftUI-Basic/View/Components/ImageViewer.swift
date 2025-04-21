//
//  ImageViewer.swift
//  SwiftUI-Basic
//
//  Created by Hamza Khalid on 17/04/2025.
//

import SwiftUI

struct ImageViewer: View {
    let uiImage: UIImage // The image to be displayed
    
    @State private var comment: String = "" // User-entered comment text
    @State private var savedComment: String? = nil // Saved comment after tapping save
    @State private var showEditOptions: Bool = false // Controls visibility of edit buttons
    @State private var scale: CGFloat = 1.0 // Current scale factor for image
    @GestureState private var gestureScale: CGFloat = 1.0 // Temporary scale factor during pinch gesture
    @Environment(\.dismiss) private var dismiss // Environment variable to dismiss the view
    
    
    var body: some View {
        ZStack {
            // Background color and tap gesture to dismiss keyboard
            Color.white
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    hideKeyboard()
                }
            
            // Display image with pinch-to-zoom functionality
            GeometryReader { geometry in
                VStack {
                    
                    Image(uiImage: uiImage)
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
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            
            VStack(spacing: 0) {
                // Top bar with Cancel (X) and Edit buttons
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .padding(3)
                            .foregroundStyle(.gray)
                    }
                    .buttonStyle(.bordered)
                    .clipShape(.circle)
                    Spacer()
                    HStack(spacing: 8) {
                        // Conditional rendering of edit tools next to edit button
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
                        .clipShape(.circle)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                // Caption input and Cancel/Save buttons
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Add a comment ...", text: $comment)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)
                        .frame(minHeight: 50)
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            savedComment = comment
                        }) {
                            Text("Save")
                                .bold()
                        }
                        .buttonStyle(.bordered)
                        .tint(.gray)
                    }
                    .padding(.horizontal)
                }
                .padding(.bottom)
            }
        }
        .navigationBarHidden(true)
    }
    
    private func hideKeyboard() {
#if canImport(UIKit)
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
#endif
    }
}

struct PhotoViewerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ImageViewer(uiImage: UIImage(named: "profile-image") ?? UIImage())
        }
    }
}

