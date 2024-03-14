//
//  HomeView.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/13.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
  let store: StoreOf<HomeReducer>
  
  var body: some View {
    NavigationView {
      VStack {
        // 상단 바
        HStack {
          // 앱 로고
          Image("app_logo")
          Text("블링블링 Blink")
            .bold()
            .lineLimit(1)
          
          Spacer()
          
          // 하트 버튼
          Button(action: {
            store.send(.showCalendarToggled)
          }) {
            Image(systemName: "heart")
          }
          
          // 종이비행기 버튼
          Button(action: {
            
          }) {
            Image(systemName: "paperplane")
          }
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        
        Spacer()
      }
    }
    .navigationBarTitle("홈")
  }
}

#Preview {
  HomeView(store: Store(initialState: HomeReducer.State()) {})
}
