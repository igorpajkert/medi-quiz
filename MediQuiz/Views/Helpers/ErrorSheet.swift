//
//  ErrorSheet.swift
//  MediQuiz
//
//  Created by Igor Pajkert on 09/04/2025.
//

import SwiftUI

struct ErrorSheet: View {
    
    let wrapper: ErrorWrapper
    
    var body: some View {
        Text(wrapper.guidance)
    }
}

#Preview {
    ErrorSheet(
        wrapper: ErrorWrapper(
            error: ErrorWrapper.SampleError.sample,
            guidance: "Test"
        )
    )
}
