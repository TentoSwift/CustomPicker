# CustomPicker

This provides a versatile sort order selection menu component with ascending/descending toggle support in SwiftUI.<br>`CustomPicker` は、SwiftUI で **並び替えの項目選択** と **昇順／降順トグル** をまとめて提供する，Menu用コンポーネントです．


https://github.com/user-attachments/assets/07003a3a-fdb9-4cce-84cd-930c1530dd6e


## Requirements

- Development with Xcode 15.0+
- Written in Swift 5.9+
- Compatible with iOS 15.0+, macOS 12.0+, tvOS 15.0+, visionOS 1.0+
- **Note:** watchOS is not supported.

## Usage

### 1. Define an enumeration conforming to `Item`.<br>`Item` 型に準拠したenumを定義します．各ケースは表示用ラベルと，昇順／降順時のラベルです．

```swift
import Foundation
import CustomPicker

enum SortType: String, Item {
    case title 
    case addDate     
    case artist     
    
    // MARK: - Item Protocol Requirements
    
    var label: String {
        switch self {
        case .title: return "タイトル順"
        case .addDate: return "追加日順"
        case .artist: return "アーティスト"
        }
    }
    
    var firstLabel: String {
        switch self {
        case .title: return "昇順"
        case .addDate: return "新しい順"
        case .artist: return "昇順"
        }
    }

    var secondLabel: String {
        switch self {
        case .title: return "降順"
        case .addDate: return "古い順"
        case .artist: return "降順"
        }
    }
}
```

### 2. Declare the previously defined enum-type variable and `Bool` variable, then pass them as bindings to use `CustomPickerView` inside a `Menu` .<br>先に定義した `enum` 型の状態変数と `Bool` 型の状態変数を用意し，Menu 内に配置した `CustomPickerView` へ渡して使用します．

```swift
import SwiftUI
import CustomPicker

struct ContentView: View {
    @State private var sortType: SortType = .addDate
    @State private var isAscending: Bool = false

    var body: some View {
        NavigationStack {
            List {
                Text("ContentView")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    // Create the Menu yourself, then embed the picker
                    Menu {
                        CustomPickerView(
                            selection: $sortType,
                            isSortAscending: $isAscending
                        )
                    } label: {
                        Label("Sort", systemImage: "ellipsis")
                    }
                }
            }
        }
    }
}
