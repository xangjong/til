



# [Java] 추상 



### 추상 (Abstract)

-	구체적으로 완성되지 않았다는 의미 (미완성)

### 추상 클래스 (Abstract Class)

-	body가 구현되지 않은 미완성 메소드를 포함하고 있다는 의미
-	구체적인 내용은 구현하지 않고 전체적인 틀만 갖춘 상황
-	상속 받는 클래스에서 용도에 맞게 구체적으로 구현해서 완성
-	추상 메소드를 포함하고 있다는 것을 제외하고는
-	일반 클래스와 동일 (생성자, 멤버 필드, 메소드 포함)

#### 추상 클래스 생성 방법

-	실체 클래스들의 공통되는 필드와 메소드를 정의
  -	공통되는 규격을 정해 놓는 것으로 
  -	상속 받는 클래스에서 반드시 이 규격대로 구현하라는 것
  -	규격 외 부분은 각 클래스 특성에 맞춰 추가
-	추상 클래스는 실체 클래스의 부모 클래스 역할
  -	주의! - new 연산자를 사용해서 단독 객체 생성 불가
    실체 클래스 : 객체를 만들어 사용할 수 있는 클래스

#### 추상 클래스의 용도

-	실체 클래스의 공통된 필드와 메소드의 이름을 통일할 목적
  -	실체 클래스 설계자가 여러 사람인 경우
  -	실체 클래스마다 필드와 메소드가 제각기 다른 이름을 가질 수 있음

-	실체 클래스를 작성할 때 시간 절약
  -	실체 클래스는 추가적인 필드와 메소드만 선언(정의)

-	실체 클래스 설계 규격을 만들고자 할 때
  -	실체 클래스가 가져야 할 필드와 메소드를 추상 클래스에서 미리 정의
  -	실체 클래스는 추상 클래스를 무조건 상속 받아 작성


#### 추상 클래스 목적

-	서브 클래스에서 필요로 하는 대부분의 기능을 구현해 두고 서브 클래스가 상속받아 활용할 수 있도록 하되
-	서브 클래스에서 반드시 구현해야 하는 기능만을 추상 메소드로 선언하여 서브 클래스에서 반드시 구현하도록 하는 것

#### 추상 클래스 선언

-	클래스 선언에 ``abstract`` 키워드 사용
-	new 연산자로 객체 생성하지 못하고 상속을 통해 자식 클래스만 생성 가능
  -	new 연산자로 객체를 생성하지는 못하지만
  -	자식 객체가 생성될 때 ``super()를`` 호출해서 추상 클래스 객체를 생성하므로

-	추상 클래스도 생성자가 필요 함

```
public abstract class 클래스명 {
            // 필드, 상수
            // 생성자
            // 메소드
}
```



### 추상 메소드 (abstract method)

-	선언은 되어 있으나 body({ })가 정의되어 있지 않은 메소드
-	abstract 키워드로 선언

```
public abstract String getName();

public abstract String setName(String name);
```



#### 추상 메소드와 오버라이딩(재정의)

-	메소드 이름 동일하지만 실행 내용이 실체 클래스마다 다른 경우 추상 메소드로 선언
-	구현 방법
-	추상 클래스에는 메소드의 선언부만 작성(추상 메소드) : 메소드의 body 없음
-	실체 클래스에서 메소드의 실행 내용 작성 (오버라이딩)

<img width="600" alt="image-20220619023928951" src="https://user-images.githubusercontent.com/101630615/174451911-969ddeef-6ef1-4093-a432-9e98bf4227d3.png">