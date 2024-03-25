//
//  NewDiaryReducer.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/25.
//

import Foundation
import ComposableArchitecture
import AVFoundation

@Reducer
struct NewDiaryReducer {
  // NewDiaryState
  @ObservableState
  struct NewDiaryState {
    var isRecording: Bool = false
    var videoURL: URL?
  }

  // NewDiaryAction
  enum NewDiaryAction {
    case startRecording
    case stopRecording
    case videoSaved(URL)
  }
  
  // NewDiaryEnvironment
  struct NewDiaryEnvironment {
    let cameraService: CameraService
    let videoService: VideoService
  }
  
  var body: some Reducer<NewDiaryState, NewDiaryAction> {
    Reduce { state, action in
      switch action {
      case .startRecording:
        state.isRecording = true
        //          return environment.cameraService.startRecording()
        return .none
        
      case .stopRecording:
        state.isRecording = false
        //          return environment.cameraService.stopRecording()
        //            .flatMap { url in
        //              environment.videoService.save(video: url)
        //                .map { .videoSaved($0) }
        //            }
        
        return .none
        
      case .videoSaved(let url):
        state.videoURL = url
        return .none
      }
    }
  }
}

protocol CameraService {
//  var session: AVCaptureSession { get }
//  
//  func startRecording() -> Effect<String>
//  func stopRecording() -> Effect<String>
}

final class CameraServiceImpl: CameraService {
//  let session = AVCaptureSession()
//  
//  func startRecording() -> Effect<String> {
//    // ... 카메라 촬영 시작 구현 ...
//  }
//  
//  func stopRecording() -> Effect<String> {
//    // ... 카메라 촬영 종료 구현 ...
//  }
}


protocol VideoService {
//  func save(video: URL) -> Effect<String>
}

final class VideoServiceImpl: VideoService {
//  func save(video: URL) -> Effect<String> {
//    // ... 비디오 저장 구현 ...
//  }
}
