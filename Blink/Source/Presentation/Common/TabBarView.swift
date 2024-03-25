//
//  TabBarView.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/13.
//

import SwiftUI
import ComposableArchitecture

struct TabBarView: View {
  @State private var selectedTab = 0

  var body: some View {
    TabView(selection: $selectedTab) {
      HomeView(
        store: Store(initialState: HomeReducer.State()) {}
      ).tabItem {
        Image(systemName: "house")
        Text("홈")
      }.tag(0)
      SearchView(
        store: Store(initialState: SearchReducer.State()) {}
      ).tabItem {
        Image(systemName: "magnifyingglass")
        Text("검색")
      }.tag(1)
      NewDiaryView().tabItem {
        Image(systemName: "plus.square")
        Text("일기기록")
      }.tag(4)
      DiaryView().tabItem {
        Image(systemName: "film")
        Text("일기")
      }.tag(2)
      MyPageView().tabItem {
        Image(systemName: "person")
        Text("마이")
      }.tag(3)
    }
  }
}

#Preview {
    TabBarView()
}
