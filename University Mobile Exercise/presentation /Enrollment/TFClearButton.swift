

import SwiftUI

struct TFClearButton: ViewModifier {
    @Binding var input: String
    @Binding var showButton: Bool
    
    func body(content: Content) -> some View {
        HStack {
            content
            if !input.isEmpty && showButton{
                Button(
                    action: { self.input = "" },
                    label: {
                        Image(systemName: "clear")
                    }
                ).accessibilityLabel("Clear Text")
            }
        }
    }
}
