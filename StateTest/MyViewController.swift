import UIKit
import SwiftUI

protocol UpdaterInput: AnyObject {
  func update(value: String)
}

class MyViewController: UIViewController {
  private var contentView: ContentView!
  private var hostingController: UIHostingController<ContentView>!
  
  public func inject(view: ContentView) {
    self.contentView = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    guard let contentView = contentView else {
      print("Viewがnilです")
      return
    }
    
    hostingController = UIHostingController(rootView: contentView)
    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    hostingController.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
    hostingController.view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    view.addSubview(hostingController.view)
  }
}

extension MyViewController: UpdaterInput {
  func update(value: String) {
    guard let contentView = contentView else { return }
    contentView.update(value: value)
  }
}
