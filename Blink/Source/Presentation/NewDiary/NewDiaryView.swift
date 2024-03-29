//
//  NewDiaryView.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/13.
//

import SwiftUI
import AVFoundation
import ComposableArchitecture

struct NewDiaryView: View {
  let store: StoreOf<NewDiaryReducer>
  
  var body: some View {
    ZStack {
      // 카메라 프리뷰
      // MARK: - https://github.com/enebin/Aespa
      /// 위 라이브러리 사용하여  CameraView 업데이트 예정
      
      // 촬영 버튼
      Button(action: {
        store.send(.startRecording)
      }) {
        Text("촬영 시작")
      }
      .padding()
      .background(Color.red)
      .foregroundColor(.white)
      
      // 촬영 종료 버튼
      if store.state.isRecording {
        Button(action: {
          store.send(.stopRecording)
        }) {
          Text("촬영 종료")
        }
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
      }
    }
    .onAppear {
      store.send(.startRecording)
    }
  }
}

#Preview {
  NewDiaryView(store: Store(initialState: NewDiaryReducer.State()) {})
}
