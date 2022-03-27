import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    guard let windowScene = (scene as? UIWindowScene) else { return }
    
    let presenter = MyViewController()
    let view = ContentView(presenter: presenter)
    presenter.inject(view: view)
    
    window = UIWindow(windowScene: windowScene)
    window?.rootViewController = presenter
    window?.makeKeyAndVisible()
  }
}

