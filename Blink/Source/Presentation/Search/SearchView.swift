//
//  SearchView.swift
//  Blink
//
//  Created by moderntec_sw on 2024/03/13.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
  let store: StoreOf<SearchReducer>
  
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(text: store.state.searchQuery)
          .padding()
        List(store.state.searchResults) { result in
                // ...
              }
        Spacer()
      }
    }
  }
}

#Preview {
  SearchView(store: Store(initialState: SearchReducer.State()) {})
}

struct SearchBar: View {
  @State var text: String
  
  var body: some View {
    HStack {
      TextField("검색어를 입력하세요", text: $text)
        .padding(.horizontal)
        .disableAutocorrection(true)
        .frame(height: 30)
        .background(Color(.systemGray6))
      Button(action: {}) {
        Image(systemName: "magnifyingglass")
          .foregroundColor(.gray)
      }
    }
  }
}


@Reducer
struct SearchReducer {
  @ObservableState
  struct SearchState: Equatable {
    var searchQuery: String = ""
    var searchResults: [SearchResult] = []
    var isSearching: Bool = false
  }
  
  
  enum SearchAction: Equatable {
    case searchQueryChanged(String)
    case searchStarted
    case searchFinished([SearchResult])
  }
  
  var body: some Reducer<SearchState, SearchAction> {
    Reduce { state, action in
      switch action {
      case .searchQueryChanged(let query):
        state.searchQuery = query
        return .none
        
      case .searchStarted:
        state.isSearching = true
//        return environment.networkService.search(query: state.searchQuery)
//          .map(.searchFinished)
//          .catchToEffect { _ in .empty }
        return .none
        
      case .searchFinished(let results):
        state.isSearching = false
        state.searchResults = results
        return .none
      }
    }
  }
}

struct SearchResult: Equatable, Identifiable {
  let id: Int
  let title: String
  let description: String
  let url: String
  let imageURL: String?
}
