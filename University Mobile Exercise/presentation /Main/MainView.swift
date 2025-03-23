//
//  University_Mobile_ExerciseApp.swift
//  University Mobile Exercise
//
//  Created by user on 19.01.22.
//
// Edited by: Azizbek Asadov, 21.03.2025

import SwiftUI

// MainView: Entry View of the application. Displaying a tabviewbar at the bottom of the application, which allows  you to navigate to three other views.

protocol TabViewFactoryProtocol {
    func make(for tab: Tabs) -> AnyView
}

struct TabViewFactory: TabViewFactoryProtocol {
    private let tabs: [Tabs]
    
    init(tabs: [Tabs]) {
        self.tabs = tabs
    }
    
    func make(for tab: Tabs) -> AnyView {
        switch tab {
        case .news:
            return  AnyView(NewsView().tab(tab.tabItem))
        case .meals:
            return AnyView(MealsView().tab(tab.tabItem))
        case .enroll:
            return AnyView(EnrollmentView().tab(tab.tabItem))
        }
    }
}

enum Tabs: Int, CaseIterable {
    case news = 0, meals, enroll
    
    static var mainTabs: [Tabs] {
        [.news, .meals, .enroll]
    }
    
    var tabItem: TabItem {
        switch self {
        case .news:
            return .init(imageName: "newspaper")
        case .meals:
            return .init(imageName: "fork.knife.circle")
        case .enroll:
            return .init(imageName: "graduationcap")
        }
    }
}

struct MainView: View {
    @State private var tabViewsFactory: TabViewFactoryProtocol = TabViewFactory(tabs: Tabs.mainTabs)
    
    var body: some View {
        if #available(iOS 15, *) {
            MainView()
                .dynamicTypeSize(.large ... .accessibility5)
        } else {
            MainView()
        }
    }
    
    @ViewBuilder
    private func MainView() -> some View {
        TabView {
            ForEach(Tabs.mainTabs, id:\.rawValue) { tab in
                tabViewsFactory.make(for: tab)
                    .accessibilityIdentifier("tab_\(tab.tabItem.imageName)")
                    .accessibilityLabel(tab.tabItem.title ?? "tab_NNN")
                    .accessibilityHint("Switches to the \(String(describing: tab.tabItem.title)) tab")
            }
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Main tab navigation")
    }
}

#Preview {
    MainView()
}
