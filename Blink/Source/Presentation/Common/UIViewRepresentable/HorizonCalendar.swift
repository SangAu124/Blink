//
//  HorizonCalendar.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/15.
//

import SwiftUI
import UIKit

import HorizonCalendar

struct HorizonCalendarView: UIViewRepresentable {
    typealias UIViewType = CalendarView
    
    private let initialContent: CalendarViewContent
    
    init(initialContent: CalendarViewContent) {
        self.initialContent = initialContent
    }
    
    func makeUIView(context: Context) -> HorizonCalendar.CalendarView {
        return CalendarView(initialContent: initialContent)
    }
    
    func updateUIView(_ uiView: HorizonCalendar.CalendarView, context: Context) {
        // 현재로서는 따로 필요하지 않아서 구현하지 않았음
    }
}
