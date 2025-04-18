

import SwiftUI

struct TFClearButton: ViewModifier {
    @Binding var input: String
    @Binding var showButton: Bool
    
    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            MainView(with: content)
                .dynamicTypeSize(.large ... .accessibility5)
        } else {
            MainView(with: content)
        }
    }
    
    @ViewBuilder
    private func MainView(with content: Content) -> some View {
        HStack {
            content
            if !input.isEmpty && showButton{
                Button(
                    action: { self.input = "" },
                    label: {
                        Image(systemName: "clear")
                    }
                )
                .accessibilityLabel("Clear Text")
                .accessibilityHint("Clears the input field")
                .accessibilityAddTraits(.isButton)
            }
        }
    }
}
