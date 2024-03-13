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
          Button(action: {}) {
            Image(systemName: "paperplane")
          }
        }
        .padding()
//        .background(Color.gray.opacity(0.2))
        
        // 캘린더
        if store.showCalendar {
          ZStack {
            // 달력 배경
            Color.white
              .cornerRadius(10)
              .shadow(radius: 5)
              .scaleEffect(store.calendarScale)
            //              .gesture(
            //                MagnificationGesture(minimumScale: 0.1, maximumScale: 10)
            //                  .onChanged { scale in
            //                    store.send(.calendarScaled(scale: scale))
            //                  }
            //              )
            
            // 캘린더 내용
            //              CalendarView(
            //                date: Date(),
            //                onDaySelected: { date in
            //                  viewStore.send(.daySelected(date: date))
            //                }
            //              )
            //              .frame(width: 300, height: 300)
            //              .padding()
            //              .scaleEffect(viewStore.calendarScale)
          }
          .frame(maxWidth: .infinity, alignment: .center)
          .padding()
          .transition(.scale)
        }
      }
    }
    .navigationBarTitle("홈")
  }
}

#Preview {
  HomeView(store: Store(initialState: HomeReducer.State()) {})
}
