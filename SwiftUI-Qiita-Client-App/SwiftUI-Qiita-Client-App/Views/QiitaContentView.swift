//
//  ContentView.swift
//  SwiftUI-Qiita-Client-App
//
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI

struct QiitaContentView: View {
  @State var isShown = false
  @ObservedObject var viewModel: QiitaContentViewModel

  init(viewModel: QiitaContentViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    NavigationView {
      List {
        searchField

        if viewModel.dataSource.isEmpty {
          emptySection
        } else {
          qiitaRowSection
        }
      }
        .listStyle(GroupedListStyle())
        .navigationBarTitle("Qiita Tag Search")
    }
  }
}

private extension QiitaContentView {
  var searchField: some View {
    HStack(alignment: .center) {
      TextField("e.g. SwiftUI", text: $viewModel.tag)
    }
  }

  var qiitaRowSection: some View {
    Section {
      ForEach(viewModel.dataSource, content: QiitaRow.init(viewModel:))
    }
  }

  var emptySection: some View {
    Section {
      Text("No results")
        .foregroundColor(.gray)
    }
  }
}

