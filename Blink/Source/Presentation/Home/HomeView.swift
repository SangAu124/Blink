//
//  HomeView.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/13.
//

import SwiftUI
import ComposableArchitecture
import HorizonCalendar

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
            .font(.title3)
          
          Spacer()
          
          // 하트 버튼
          Button(action: {
            store.send(.showCalendarToggled)
          }) {
            Image(systemName: "heart")
              .foregroundColor(.black)
          }
          
          // 종이비행기 버튼
          Button(action: {
            
          }) {
            Image(systemName: "paperplane")
              .foregroundColor(.black)
          }
        }
        .padding(.top)
        .padding(.trailing)
        .padding(.leading)
        
        ScrollView {
          HorizonCalendarView(initialContent: makeContent())
        }
        .frame(width: .infinity, height: .infinity)
        .ignoresSafeArea()
      }
    }
    .navigationBarTitle("홈")
  }
  
  // MARK: - Functions
  func makeContent() -> CalendarViewContent {
    let startDate = Calendar.current.date(byAdding: .year, value: -2, to: Date())!
    let endDate = Calendar.current.date(byAdding: .year, value: 2, to: Date())!
    
    return CalendarViewContent(
      calendar: Calendar.current,
      visibleDateRange: startDate...endDate, // 캘린더에 보여줄 날짜 범위
      monthsLayout: .horizontal(options: .init()) // 또는 .vertical사용 가능
    )
    .dayItemProvider { day in
        Text("\(day.day)")
            .font(.system(size: 18))
            .foregroundColor(Color(UIColor.green))
            .calendarItemModel // 끝에 붙여주기
    }
    .monthHeaderItemProvider { month in
        Text("\(month.month)월")
            .padding()
            .background(.blue)
            .calendarItemModel // 끝에 붙여주기
    }

  }
}

#Preview {
  HomeView(store: Store(initialState: HomeReducer.State()) {})
}
