//
//  ContentView.swift
//  HomeControls
//
//  Created by Suneel Gunupudi on 04/09/20.
//  Copyright © 2020 Suneel. All rights reserved.
//

//reference Video  - https://www.youtube.com/watch?v=uw2XX7t-aSQ

import SwiftUI

struct ContentView: View {
    @ObservedObject var tabManager = TabManager()
    var body: some View {
        VStack {
            containerView()
            Spacer()
            CustomTabView(manager: tabManager)
                .padding(.leading, 30)
                .padding(.trailing, 30)
        }
        .padding(.top, 60)
        .padding(.bottom, 40)
        .background(ColorConstants.background)
        .edgesIgnoringSafeArea(.all)
    }

    func containerView() -> some View {
        switch tabManager.lastSelectedIndex {
        case 0:
            return TemperatureView(row: tabManager.lastSelectedIndex)
        case 1:
            return TemperatureView(row: tabManager.lastSelectedIndex)
        case 2:
            return TemperatureView(row: tabManager.lastSelectedIndex)
        case 3:
            return TemperatureView(row: tabManager.lastSelectedIndex)
        default:
            return TemperatureView(row: tabManager.lastSelectedIndex)
        }
    }
}

struct LightCircle: View {
    var body: some View {
        VStack {
            Circle()
        }
    }
}



struct CustomTabView: View {
    @ObservedObject var manager: TabManager
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40.0)
                .frame(height: 80)

            HStack(spacing: 30) {
                ForEach(manager.tabMenu) { menu in
                    MenuItemVIew(menu: menu)
                        .onTapGesture {
                            self.manager.seletMenu(index: menu.id)
                    }
                }
            }.onAppear {
                self.manager.seletMenu(index: 0)
            }
        }
    }
}

struct MenuItemVIew: View {
    let menu: TabMenu
    var body: some View {
        ZStack {
            Circle()
                .fill(menu.color)
                .frame(width: 50, height: 50)
                .opacity(menu.selected ? 1.0 : 0.0)
            Image(systemName: menu.imageName)
                .foregroundColor(menu.selected ? .white : .gray)
                .font(.title)

        }
    }
}

struct TabMenu: Identifiable {
    let id: Int
    let imageName: String
    let color: Color
    var selected: Bool = false
}

struct AppData {
    static let menus = [
        TabMenu(id: 0, imageName: "thermometer", color: ColorConstants.tempBackground),
        TabMenu(id: 1, imageName: "snow", color: ColorConstants.lightTab),
        TabMenu(id: 2, imageName: "lightbulb", color: ColorConstants.lightTab),
        TabMenu(id: 3, imageName: "lightbulb", color: ColorConstants.waterBackground)
    ]
}

class TabManager: ObservableObject {
    @Published var tabMenu = AppData.menus
    @Published var lastSelectedIndex = -1

    func seletMenu(index: Int) {
        if index != lastSelectedIndex { tabMenu[index].selected = true
            if lastSelectedIndex != -1 {
                tabMenu[lastSelectedIndex].selected = false
            }
            lastSelectedIndex = index
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
