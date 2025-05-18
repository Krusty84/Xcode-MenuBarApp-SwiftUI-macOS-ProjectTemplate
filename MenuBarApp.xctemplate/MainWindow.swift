//
//  MainWindow.swift
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___
//

import SwiftUI
/**

 ## Don't forget to add the `ElegantTabs` dependency:

 1. Click File → Add Packages…
 2. In the search box in the upper right, enter:
    https://github.com/Krusty84/ElegantTabs
 3. Click Add Package
 4. Click Add Package, again

 */
import ElegantTabs

struct MainWindow: View {
    @State private var selectedTab = 0
    var body: some View {
        ElegantTabsView(selection: $selectedTab) {
                  TabItem(title: "TabOne", icon: .system(name: "person.crop.circle")) {
                      TabOneContent()
                  }
                  TabItem(title: "Settings", icon: .system(name: "gearshape.fill")) {
                      SettingsTabContent()
                  }
                  TabItem(title: "About", icon: .system(name: "info")) {
                      AboutTabContent()
                  }
              }
    }
}
