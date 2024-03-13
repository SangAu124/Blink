//
//  HomeReducer.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/13.
//

import Foundation
import ComposableArchitecture

@Reducer
struct HomeReducer {
  @ObservableState
  struct HomeState: Equatable {
    var showCalendar: Bool = true
    var calendarScale: CGFloat = 1.0
    var selectedDate: Date? = nil
  }
  
  enum HomeAction: Equatable {
    case showCalendarToggled
    case calendarScaled(scale: CGFloat)
    case daySelected(date: Date)
  }
  
  var body: some Reducer<HomeState, HomeAction> {
    Reduce { state, action in
      switch action {
      case .showCalendarToggled:
        state.showCalendar.toggle()
        return .none
        
      case .calendarScaled(let scale):
        state.calendarScale = scale
        return .none
        
      case .daySelected(let date):
        state.selectedDate = date
        // 날짜 선택 시 처리
        return .none
      }
    }
  }
}
