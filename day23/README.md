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

쉽게 이해하기위해서 modifier하나를 추가할 때 마다 해당 화면을 렌더링 한다고 생각 할 수 있다.

하지만 실제로 그런식으로 동작하지는 않는다 (성능상 문제가 많을것이다), 그래도 배우는 동안 그렇게 생각하는편이 이해하기에 쉬울 것 이다.

### # Why does SwiftUI use “some View” for its view type?

> SwiftUI relies very heavily on a Swift power feature called “opaque return types”, which you can see in action every time you write `some View`. This means “one specific type that conforms to the `View` protocol, but we don’t want to say what.”

some View는 View 프로토콜을 따르는 어떠한 한가지 타입을 가리키지만 그게 무엇인지 정확히 명시하고 싶지 않다는 의미이다.

some View를 사용하지 않으려면 어떻게 해야할까

```
struct ContentView: View {
    var body: View {
        Text("Hello World")
    }
}
```

위와같은 표현은 허용되지 않는다. some View 대신에 그냥 View를 사용하는것은 이전에 이야기한 의미를 충족하지 못한다.

```swift
struct ContentView: View {
    var body: Text {
        Text("Hello World")
    }
}
```

이렇게는 사용할 수 있다. 왜냐하면 body는 Text타입을 가리킨다는것을 정확히 명시한 것이고 실제로 Text타입이 존재한다.

이전에 사용하던 코드로 돌아가보자

```
Button("Hello World") {
    print(type(of: self.body))
}
.frame(width: 200, height: 200)
.background(Color.red)
```

여기서 body에 some View 대신에 타입을 직접 적어주려면 어떻게 적어야 할까?

ModifiedContent의 제네릭 타입을 정확히 알아내서 적을 수 있지만 그건 너무 힘든 작업이다.

이런 작업을 피하기위해 some View를 사용한다. 

### # Conditional modifiers

특정 상황에서만 적용되는 modifier를 사용하려면 삼항연산자를 사용한다.

```swift
struct ContentView: View {
    @State private var useRedText = false

    var body: some View {
        Button("Hello World") {
            // flip the Boolean between true and false
            self.useRedText.toggle()            
        }
        .foregroundColor(useRedText ? .red : .blue)
    }
}
```

userRedText가 true이면 빨강 false이면 파랑 배경색이 됩니다. 또한 SwiftUI는 @State 에서 변경을 즉시 감지하고 속성을 변경하기때문에 색상이 즉시 변경 됩니다.

```swift
var body: some View {
    if self.useRedText {
        return Text("Hello World")
    } else {
        return Text("Hello World")
            .background(Color.red)
    }
}
```

예를들어 이런 코드는 불가능합니다.

some View는 어떠한 한가지 타입을 의미한다고 바로 이전에 이야기 했었습니다.

위의 코드는 Text(…) 타입과 Text(…).background(Color.red) 타입으로 서로 다르다고 볼 수 있으며 이는 some View에서 허용 되지않습니다.

```swift
var body: some View {
 if self.useRedText {
 return Text("Hello World")
 .background(Color.blue)
 } else {
 return Text("Hello World")
 .background(Color.red)
 }
}
```

return 되는 형태를 일치시키면 사용이 가능합니다.

### # Environment modifiers

동일한 modifier를 여러 View에 동시에 적용하기 위한 방법을 제공합니다.

```swift
VStack {
    Text("Gryffindor")
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title)
```

이것을 Environment modifier라고 하며 만약 하위뷰에 동일한 modifier를 사용하는 경우 하위뷰에서 적용되는것이 우선됩니다.

```swift
VStack {
    Text("Gryffindor")
        .font(.largeTitle)
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.font(.title)
```

4개의 View중 한개에만 largeTitle font가 적용됩니다

```swift
VStack {
    Text("Gryffindor")
        .blur(radius: 0)
    Text("Hufflepuff")
    Text("Ravenclaw")
    Text("Slytherin")
}
.blur(radius: 5)
```

blur 는 동일한 방식을 적용 할 수 없습니다. Environment modifier가 아니기 때문입니다.

어떤 modifier가 Environment modifier인지 아닌지 미리 구분하는 방법은 특별히 없습니다. 직접 코드를 실험해서 알아내는방법을 사용합니다.

### # Views as properties

복잡한 구조를 정리하기위해 뷰를 프로퍼티로 만들 수 있습니다.

```swift
struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")

    var body: some View {
        VStack {
            motto1
            motto2
        }
    }
}
```

```swift
VStack {
    motto1
        .foregroundColor(.red)
    motto2
        .foregroundColor(.blue)
}
```

modifier또한 사용 가능합니다.

뷰를 프로퍼티로 만들면 코드를 명확하게 하는데 도움이됩니다. 반복을 피할 뿐만아니라 body에서 한번 더 수정 할 수 있습니다.

하지만 프로퍼티로 다른 프로퍼티를 참조하는 TextField를 생성할 수 없습니다. 왜냐하면 프로퍼티가 생성되는 시점에 또다른 프로퍼티는 아직 생성되지 않았을 수 있기때문에 프로퍼티간에 참조가 불가능합니다.

### #View composition

```swift
struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Capsule())

            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Capsule())
        }
    }
}
```

이와같이 복잡하지만 같은 구조의 뷰를 더 간단하게 만들 수 있다.

```swift
struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
            CapsuleText(text: "Second")
        }
    }
}
```

물론 일부 modifier만 공통적으로 적용하고 일부는 다르게 적용 할 수 있다.

```swift
VStack(spacing: 10) {
    CapsuleText(text: "First")
        .foregroundColor(.white)
    CapsuleText(text: "Second")
        .foregroundColor(.yellow)
}
```

### #Custom modifiers

지금까지는 내장 modifier를 사용하는 법에 대해 알아보았다. 우리는 직접 custom modifier를 만드는것이 가능하다.

이를 위해서는 먼저 내가 만들 modifier가 어떻게 동작할지 지정할 구조체를 정의해야 한다.

```swift
struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
```

Title이라는 이름의 구조체를 만들었으며 modifier로 사용 할 때는 아래와 같이 사용한다.

```swift
Text("Hello World")
    .modifier(Title())
```

.modifier() 안에 구조체를 넣어서 사용해야 하고 이는 지금까지 사용하던 modifier와 차이가 크다.

더 쉽게 사용하기위해 아래와같이 wrapping해서 사용하는것이 현명하다.

```swift
extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}
```

이제 드디어 다른 modifier들 처럼 사용 할 수 있다.

```swift
Text("Hello World")
    .titleStyle()
```

custom modifier는 단순히 다른 modifier 여러개를 한번에 적용하는 정도가 아닌 뷰구조를 생성하는 작업도 가능하다. 예를들어 아래와 같이 다른 뷰들을 추가하는 modifier를 만드는것도 가능하다.

```swift
struct Watermark: ViewModifier {
    var text: String

    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}
```

이 modifier를 사용한다면 워터마크를 추가할 수 있게 된다.

```swift
Color.blue
    .frame(width: 300, height: 200)
    .watermarked(with: "Hacking with Swift")
```
