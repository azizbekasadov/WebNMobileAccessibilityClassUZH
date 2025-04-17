//
//  View+.swift
//  University Mobile Exercise
//
//  Created by Azizbek Asadov on 21.03.2025.
//

import SwiftUI

struct TabItem: Identifiable {
    let id: String
    let title: String?
    let imageName: String
    
    init(
        id: String = UUID().uuidString,
        title: String? = nil,
        imageName: String
    ) {
        self.id = id
        self.title = title
        self.imageName = imageName
    }
}

extension View {
    func tab(
        _ tabItem: TabItem
    ) -> some View {
        self.tabItem {
            Image(systemName: tabItem.imageName)
                .resizable()
                .frame(width: 24, height: 24)
            
            if let title = tabItem.title, tabItem.title.isEmptyOrNil {
                Text(title)
                    .foregroundColor(.primary)
            }
        }
        .accessibilityLabel(Text(tabItem.imageName))
    }
    
    func tab(
        systemIcon: String,
        title: String = ""
    ) -> some View {
        self.tabItem {
            Image(systemName: systemIcon)
            if !title.isEmpty {
                Text(title)
                    .foregroundColor(.primary)
            }
        }
    }
}
