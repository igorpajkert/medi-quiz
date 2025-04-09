//
//  SampleImage.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct SampleImage: View {
    
    let image: ImageResource
    let width: CGFloat
    let height: CGFloat
    let shadowRadius: CGFloat
    
    init(
        image: ImageResource,
        width: CGFloat = 120,
        height: CGFloat = 120,
        shadowRadius: CGFloat = 4
    ) {
        self.image = image
        self.width = width
        self.height = height
        self.shadowRadius = shadowRadius
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
            .shadow(radius: shadowRadius)
    }
}

#Preview {
    SampleImage(image: .account)
}
