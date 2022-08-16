

# [Java] 인터페이스



### 인터페이스란?

-	객체의 사용 방법을 정의한 타입
-	클래스들이 구현해야 하는 동작을 지정하는데 사용되는 추상형
-	미리 정해진 규칙에 맞게 구현하도록 표준을 제시하기 위해 사용
-	추상 클래스와 유사
-	기본 설계도의 의미 (규격/표준을 정함)

#### 인터페이스의 역할

-	개발 코드와 객체가 서로 통신하는 접점 역할
-	개발 코드가 인터페이스의 메소드를 호출하면
-	인터페이스는 객체의 메소드 호출
-	개발 코드는 객체의 내부 구조를 알 필요 없고
-	인터페이스의 메소드만 알면 됨

<img width="500" alt="image-20220620002852537" src="https://user-images.githubusercontent.com/101630615/174490742-34caef58-1dc1-4792-beef-20b0ac344e49.png">

#### 개발 코드와 객체 중간에 인터페이스를 사용하는 이유

-	개발 코드를 수정하지 않고 사용하는 객체를 변경하기 위함
-	인터페이스는 하나의 객체가 아니라 여러 객체들과 사용이 가능하므로
-	어떤 객체를 사용하느냐에 따라 실행 내용과 리턴 값이 달라짐
-	**개발 코드 측면에서는 사용하는 객체에 따라 코드를 변경하지 않고 실행 내용과 리턴값을 다양화할 수 있다는 장점**
-	개발 코드가 객체에 종속되지 않게 객체 교체할 수 있도록 하는 역할
-	개발 코드 변경 없이 리턴값 또는 실행 내용이 다향해짐(다형성)

#### 인터페이스 특징

-	인터페이스는 객체를 생성할 수 없다
  -	구현되지 않은 **추상 메소드**를 포함하고 있기 때문

-	객체를 생성할 수 없기 때문에 생성자를 가질 수 없음
-	**인터페이스 간에 상속**
-	인터페이스를 **상속받아 클래스를 구현하면 모든 추상 인터페이스의  메소드를 구현해야 함**

#### 인터페이스 작성 과정
(1)	선언 

-	interface 키워드로 선언
-	 ``[public] interface 인터페이스명 { …. }``

(2)	구현

-	클래스에서 인터페이스 구현
-	implements 키워드로 명시

(3)	사용

- 인터페이스에 구현된 클래스의 객체 대입 

  

### 인터페이스 구성 멤버

<img width="400" alt="image-20220620004043336" src="https://user-images.githubusercontent.com/101630615/174490749-f9087942-5892-414e-a475-7cd51bb34fc5.png">



### 상수 필드 

-	인터페이스는 데이터를 저장할 수 없기 때문에 데이터를 저장할 인스턴스 또는 정적 필드를 선언 불가

-	상수 필드는 선언 가능
  -	인터페이스에 고정된 값으로 런타임 시 데이터를 바꿀 수 없음

-	인터페이스에 선언된 필드는 모두 ``public static final``
  -	자동적으로 컴파일 과정에 붙음

-	인터페이스는 인스턴스 필드는 가질 수 없음

#### 상수 필드 선언 형식

```
[public static final] 타입 상수명 = 값;
```

-	``public, static, final``을 생략하더라도 컴파일 과정에서 자동으로 붙음
-	선언과 동시에 초기값 지정
  -	static { } 블록 작성 불가 (static {} 으로 초기화 불가)
-	상수명은 대문자로 작성
  -	서로 다른 단어로 구성되어 있을 경우에는 밑줄 문자(_)로 연결



### 추상 메소드 

-	선언은 되어 있으나 body가 정의되어 있지 않은 메소드 (중괄호 {  } 없음)
-	객체가 가지고 있는 메소드를 설명한 것으로
  -	메소드명, 매개변수, 리턴 타입만 기술

-	실제 실행 내용은 객체(구현 객체)에 작성
  -	실체 클래스에서 메소드의 실행 내용 작성

-	이클립스에서 구현 클래스 생성하면서 인터페이스 지정하면 추상 메소드 자동 오버라이딩 되서 생성
-	인터페이스를 통해 호출된 메소드는 최종적으로 객체에서 실행

#### 추상 메소드 선언 형식

```
[public abstract] 리턴타입 메소드명(매개변수, …);
```

- 인터페이스의 메소드는 기본적으로 실행 블록이 없는 추상 메소드로 선언

-	인터페이스에서 선언된 추상 메소드는 모두 public abstract 
-	public abstract를 생략하더라도 자동적으로 컴파일 과정에서 붙게됨



### 정적 메소드 (Static Method)

-	디폴트 메소드와 달리 객체 없어도 인터페이스만으로 호출 가능한 메소드
-	객체 생성 없이 인터페이스만으로 호출 가능한 메소드
-	``static`` 키워드 사용
-	실행 블록을 가지고 있는 메소드

#### 정적 메소드 선언 형식

```
[public] static 리턴타입 메소드명(매개변수, ..) { 
		// 실행 블록이 있음 …
}
```



#### ``private`` 메소드

-	인터페이스 내에서만 사용 가능한 메소드
-	디폴트 또는 정적 메소드 내에서 사용하기 위해 작성되는 메소드
-	인터페이스를 구현 클래스에서 재정의하거나 사용할 수 없음



### 다중 인터페이스 

-	다수의 인터페이스 타입으로 사용
-	다중 인터페이스를 구현할 경우 구현 클래스는 모든 인터페이스의 추상 메소드에 대해 실체 메소드를 작성해야 함

```
public class 구현클래스명 implements 인터페이스 A, 인터페이스 B {
		인터페이스 A에 선언된 추상 메소드의 실체 메소드 선언
		인터페이스 B에 선언된 추상 메소드의 실체 메소드 선언
}
```



### 인터페이스 상속

-	인터페이스 간 상속 가능
-	다중 상속 가능

```
public interface 하위인터페이스 extends 상위인터페이스1, 상위인터페이스2 {....}
```

***주의!***

-	하위 인터페이스를 구현한 클래스는 아래 추상 메소드를 모두 재정의 (모든 인터페이스의 추상 메소드를 재정의해야 함)

#### 인터페이스 자동 타입 변환

-	구현 클래스로부터 객체 생성 후 하위 및 상위 인터페이스 타입으로 변환 가능
-	하위인터페이스로 타입 변환되는 경우
  -	상/하위 인터페이스에 선언된 모든 메소드 사용 가능
-	상위 인터페이스로 타입 변환되는 경우
  -	상위 인터페이스에 선언된 메소드만 사용 가능하고
  -	하위 인터페이스에 선언된 메소드는 사용 불가

<img width="800" alt="image-20220620005134204" src="https://user-images.githubusercontent.com/101630615/174490755-fe63defb-379c-443a-b000-d38fbce1efe1.png">

#### 디폴트 메소드

-	실행 블록을 가지고 있는 메소드
-	인터페이스에 선언된 인스턴스 메소드로 구현 객체가 있어야 사용 가능
-	선언은 인터페이스에서 하고, 사용은 구현 객체를 통해서
-	디폴트 메소드를 허용하는 이유
  -	기존 인터페이스를 확장해서 새로운 기능을 추가하기 위해
  -	추상 메소드로 선언하면 구현 클래스에서 필요 없어도 반드시 구현해야 하지만
  -	디폴트 메소드로 선언하면 구현 클래스에서 실제 메소드를 작성할 필요가 없음




### 인터페이스에 새로운 메소드 추가하는 경우

<img width="600" alt="image-20220620010832365" src="https://user-images.githubusercontent.com/101630615/174490756-aab0db24-23f8-471f-99b9-723beade58f1.png">



### 디폴트 메소드가 있는 인터페이스 상속

-	부모 인터페이스의 디폴트 메소드를 자식 인터페이스에서 활용 방법
-	(1) 디폴트 메소드를 단순히 상속만 받음
-	(2) 디폴트 메소드를 재정의(Override)해서 실행 내용을 변경
-	(3) 디폴트 메소드를 추상 메소드로 재선언

### 익명 구현 객체

-	구현 클래스를 만들어서 사용하는 것이 일반적이고
-	클래스를 재사용할 수 있기 때문에 편리하지만
-	일회성으로 객체가 필요한 경우에는
-	익명 구현 객체를 사용
-	익명 구현 객체 형식

```
인터페이스 변수 = new 인터페이스() {
		// 인터페이스에 선언된 추상 메소드 재정의
}
```

-	new 연산자 뒤에 클래스 이름 없음 