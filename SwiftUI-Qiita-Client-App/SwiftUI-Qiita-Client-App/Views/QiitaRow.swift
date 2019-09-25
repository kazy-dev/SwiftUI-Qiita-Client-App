//
//  QiitaRow.swift
//  SwiftUI-Qiita-Client-App
//
//  Copyright © 2019 kazy. All rights reserved.
//

import SwiftUI

struct QiitaRow: View {
  private let viewModel: QiitaRowViewModel
  
  @State var isShowSafariAlert = false
  
  var openUrl: URL? {
    viewModel.url
  }
  
  init(viewModel: QiitaRowViewModel) {
    self.viewModel = viewModel
  }
  
  var body: some View {
    HStack(alignment: .center) {
      Group {
        VStack(alignment: .leading) {
          Text("\(viewModel.title)")
          Text("\(viewModel.name)")
        }
        ZStack {
          Button("") {
            self.isShowSafariAlert = true
          }
        }
      }
    }.alert(isPresented: $isShowSafariAlert, content: {
      Alert(title: Text(""),
            message: Text("safariを起動しますか?"),
            primaryButton: .default(Text("ok"),
                                    action: {
                                      self.isShowSafariAlert = false
                                      guard let url = self.viewModel.url else {return}
                                      UIApplication.shared.open(url)
            }),
            secondaryButton: .cancel(Text("キャンセル")))
    })
  }
}
