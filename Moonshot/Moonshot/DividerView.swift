//
//  DividerView.swift
//  Moonshot
//
//  Created by Tony Alhwayek on 1/15/24.
//

import SwiftUI

struct DividerView: View {
    let height: CGFloat = 2
    
    var body: some View {
        Rectangle()
            .frame(height: height)
            .foregroundStyle(.lightBackground)
    }
}

#Preview {
    DividerView()
}
