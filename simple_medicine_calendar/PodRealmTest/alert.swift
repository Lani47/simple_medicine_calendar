//
//  alert.swift
//  PodRealmTest
//
//  Created by cmStudent on 2022/12/02.
//

import SwiftUI

struct AlertView: UIViewControllerRepresentable {

  @Binding var isPresented: Bool

  var title: String
  var message: String
  var actions: [(title: String?, style: UIAlertAction.Style, completionHandler: () -> Void )]

  func makeCoordinator() -> AlertView.Coordinator {
    Coordinator(self)
  }

  class Coordinator: NSObject {

    var alert: UIAlertController?

    var control: AlertView

    init(_ control: AlertView) {
      self.control = control
    }
  }

  func makeUIViewController(context: UIViewControllerRepresentableContext<AlertView>) -> UIViewController {
    UIViewController() // UIAlertControllerを表示するコンテナ
  }

  func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<AlertView>) {
    if isPresented {
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      context.coordinator.alert = alert

      actions.forEach { action in
        alert.addAction(UIAlertAction(title: action.title, style: action.style, handler: { _ in
          action.completionHandler()
          alert.dismiss(animated: true) {
            self.isPresented = false
          }
        })
        )
      }

      DispatchQueue.main.async {
        uiViewController.present(alert, animated: true, completion: {
          self.isPresented = false
          context.coordinator.alert = nil
        })
      }
    }
  }
}
