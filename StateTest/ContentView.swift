import SwiftUI

struct ContentView: View {
  @State private var value = ""
  @State private var directValue = ""
  @State private var input = ""
  weak var presenter: UpdaterInput?
  
  var body: some View {
    VStack(spacing: 10) {
      TextField("入力", text: $input)
        .onSubmit {
          self.presenter?.update(value: input)
          self.directUpdate(value: input)
        }
      Text("value: \(self.value)")
      Text("directValue: \(self.directValue)")
    }
    .padding()
  }
}

extension ContentView {
  func update(value: String) {
    print("[presenter] in value: \(value)")
    print("[presenter] before self.value: \(self.value)")
    self.value = value
    print("[presenter] after self.value: \(self.value)")
  }
  
  func directUpdate(value: String) {
    print("[direct] in value: \(value)")
    print("[direct] before self.directValue: \(self.directValue)")
    self.directValue = value
    print("[direct] after self.directValue: \(self.directValue)")
  }
}
