//
//  Home.swift
//  ColorsPicker
//
//  Created by Skander BAHRI on 02/01/2023.
//

import SwiftUI

struct Home: View {
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            /// - Extracting SafeArea ( Window n macOS ) from proxy
            let safeArea = proxy.safeAreaInsets
            
            ScrollView(.vertical, showsIndicators: true) {
                VStack(spacing: 8) {
                    ForEach(colors) { color in
                       CardView(item: color, rectSize: size)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
            }
            /// Material Top bar
            .safeAreaInset(edge: .top) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(height: safeArea.top)
                    .overlay {
                        Text("Colors Picker")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .opacity(0.8)
                    }
                    .overlay(alignment: .trailing) {
                        Text("V1.0.0")
                            .font(.caption)
                            .foregroundColor(.black)
                            .padding(.trailing, 8)
                    }
            }
            .ignoresSafeArea(.container, edges: .all)
        }
        .frame(width: 380, height: 500)
        .preferredColorScheme(.light)
    }
    
    @ViewBuilder
    func CardView(item: ColorValue, rectSize: CGSize) -> some View {
        Rectangle()
            .overlay {
                Rectangle()
                    .fill(item.color.gradient)
            }
            .overlay {
                Rectangle()
                    .fill(item.color.opacity(0.5).gradient)
                    .rotationEffect(.init(degrees: 180))
            }
            .frame(height: 110)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}