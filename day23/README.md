### # What is behind the main SwiftUI view?

작은 크기의 빨간 배경의 텍스트 뷰

```swift
Text("Hello World")
            .background(Color.red)
```



세이프 영역 안에서 빨간 배경을 가득 채우는 텍스트 뷰

```swift
Text("Hello World")
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.red)
```



세이프영역을 넘어서 모두 빨간 배경으로 채우는 텍스트뷰

```swift
Text("Hello World")
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.red)
    .edgesIgnoringSafeArea(.all)
```




