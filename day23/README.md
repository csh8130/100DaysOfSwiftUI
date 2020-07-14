### # What is behind the main SwiftUI view?

> 작은 크기의 빨간 배경의 텍스트 뷰
> 
> ```swift
> Text("Hello World")
>             .background(Color.red)
> ```

> 세이프 영역 안에서 빨간 배경을 가득 채우는 텍스트 뷰
> 
> ```swift
> Text("Hello World")
>     .frame(maxWidth: .infinity, maxHeight: .infinity)
>     .background(Color.red)
> ```

> 세이프영역을 넘어서 모두 빨간 배경으로 채우는 텍스트뷰
> 
> ```swift
> Text("Hello World")
>     .frame(maxWidth: .infinity, maxHeight: .infinity)
>     .background(Color.red)
>     .edgesIgnoringSafeArea(.all)
> ```

### # Why modifier order matters (modifier의 순서가 중요한 이유)

```swift
Button("Hello World") {
    // do nothing
}    
.background(Color.red)
.frame(width: 200, height: 200)
```

위의 코드는 200x200 크기의 빨간 정사각형 버튼이 만들어지지 않는다.

200x200크기의 비어있는 사각형의 정중앙에 작은 크기의 빨간 텍스트 사각형이 보이게된다.



왜 이런일이 발생했는지 알아보기위해 뷰의 바디를 출력해본다.

```swift
Button("Hello World") {
    print(type(of: self.body))
}    
.background(Color.red)
.frame(width: 200, height: 200)
```

> Swift’s `type(of:)` method prints the exact type of a particular value, and in this instance it will print the following: `ModifiedContent<ModifiedContent<Button<Text>, _BackgroundModifier<Color>>, _FrameLayout>`

`ModifiedContent<이곳에 순서대로 쌓인다>`

순서가 중요하다는점을 알 수 있다.



```swift
Button("Hello World") {
    print(type(of: self.body))
}
.frame(width: 200, height: 200)
.background(Color.red)
```

frame과 background의 순서를 바꾸면 원하는 결과가 나오는것을 알 수 있다.




