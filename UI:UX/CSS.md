# CSS(스타일 시트)



#### Cascading Style Sheets : 계단형 스타일 시트

- 단계적으로 스타일 적용
- 여러 스타일이 겹치면 맨 **마지막 스타일 적용**
- HTML의 레이아웃 배치 등의 한계를 보완하기 위해 개발된 독립 언어
- 일정 기능들을 미리 지정하여 여러 부분에서 동일하게 적용

#### 가능한 작업

- HTML 문서 내의 글꼴, 크기, 색상, 배경, 테두리, 레이아웃 배치, 여백 등 지정
- 글자의 정렬 방식, 그림자 지정 등 다양한 효과
- 애니메이션, 동적 기능 구현 가능



#### 스타일 시트 장점

- 자유롭게 웹 문서 편집
  - HTML 한계점 극복 가능
- 통일감 있는 문서 작성
  - 한 번만 정의하여 문서에 일관되게 적용 가능
- 편리한 문서 관리
  - 외부스타일, 스타일 시트 파일을 사용할 경우
  - 여러 웹 문서에 동일한 스타일 시트 가용 가능하고
  - 한 번만 수정하여 모든 웹 문서의 스타일을 동시에 변경 가능

### 스타일 시트 적용 방법

##### 1. 문서 내부에 정의(Embedded Style)

- ``<head>`` 태그에 삽입
- 문서 전체에 특정 효과 주기 위해 사용

```
<head>
	<style type="text/css">
	태그명 { 속성(property) : 값(value); }
	</style>
</head>

ex ) 
	<head>
		<style type="text/css">
		body { font-size:15pt; color : blue; }
		</style>
	</head>
```



##### 2. 외부 문서에 연결(Linked Style)

- 별도의 스타일 시트 문서를 만들어 놓고
- 필요한 HTML 문서에 연결하여 사용
- 웹 사이트의 모든 문서에 동일한 효과를 적용하여 웹사이트에 통일감을 주고 싶을 때 사용
- 규모가 커지면 반드시 외부 문서에 연결하여 사용

```
<head>
	<link rel="stylesheet" type="text/css" href="파일명">
</head>

ex) 
	<head>
		<link rel="stylesheet" type="text/css" href="myStyle.css">
	</head>
```



##### 3. 태그에 직접 정의(Inline Style)

- 특정 태그에만 스타일 시트를 적용할 때 사용 

```
<태그명 style = "속성(property) : 값(value)";>

ex) <body style = "font-size : 15pt; color : blue;">
	<button onClick = "green()" style = "width:120; height:30;">
```



#### 다중 스타일 시트

- 하나의 요소에 대하여 외부, 내부, 인라인 스타일이 서로 다르게 지정되어 있는 경우 적용되는 스타일
- 스타일 적용 순서
  - 웹 브라우저 디폴트 값
  - 외부 스타일
  - ``<head>``부분의 내부 스타일
  - 태그에 정의된 인라인 스타일(최종 적용된 스타일)

##### 스타일 시트의 기본 형식

- 선택자 (selector)
  - 스타일을 적용할 대상
  - HTML 문서의 태그, 아이디, 클래스, 속성 등으로 선택
- 형식 : { 속성 : 값; }
  - 변경(적용)하고자 하는 속성
  - 글꼴, 크기, 색상, 위치 등
- 사용 예 : (태그 선택자) 모든 ``<h1>`` 태그에 스타일 적용
  - h1 { color : red**;** }





# 선택자 유형

#### 1. 태그 선택자

- 태그명 사용
- 요소(element) 선택자 
- HTML 문서에 있는 같은 **모든 태그에 동일하게 적용**

```
태그명 { 속성 : 값 ; }
```

```
h3 { 
	backgroud-color : #000;
	color : #fff;
	width : 50%;
	margin-left:20px;
}
```



#### 2. 클래스 선택자

- 문서에서 특정 부분에만 필요한 CSS 적용할 때 사용 
- ```.``` 사용
- 사용자 정의 선택자 또는 **도트(.) 선택자**라고 함
- 정의한 클래스 선택자를 태그에 적용
  - 여러 태그에 적용 가능
  - 그룹화 의미
- 형식

```
.클래스이름 { 속성 : 값; }

<태그명 class = "클래스이름"></태그>
```

![clip_image010](https://user-images.githubusercontent.com/101630615/173483193-cebb6c44-d17f-423a-b43a-ad45d80da0bc.jpg)

#### 3. 아이디 선택자

- 문서에서 특정 부분에만 필요한 CSS 적용할 때 사용
- 필요한 부분에 **유일한 아이디**를 지정하고 CSS 적용
- 식별 선택자
- ``#``사용
- 형식

```
#아이디명 { 속성 : 값 ; }

<태그명 id = "아이디이름"></태그>
```

![clip_image012](https://user-images.githubusercontent.com/101630615/173483199-5702662b-7cbe-42c7-abbd-c94daa279a2e.jpg)

#### 4. 속성 선택자

- 문서에 삽입된 HTML 태그의 지정된 속성 값에 따라 선택자로 정의
- 형식

```
태그명 [속성 = "값"]
: 일치하는 값
태그명 [속성 ^= "값"]
: 시작하는 값
태그명 [속성 $= "값"]
: 끝나는 값
```



#### 5. 상태 선택자

- 태그의 상태에 따라 선택 가능
- 선택자 :``checked``   -  체크된 input 태그 선택
- 선택자 :``focus`` -  포커스를 받은 input 태그 선택
- 선택자 :``enabled`` -  사용 가능한 input 태그 선택
- 선택자 :``disabled`` -  사용 불가능한input 태그 선택



# CSS 속성

#### 텍스트 속성

![clip_image014](https://user-images.githubusercontent.com/101630615/173483206-09738649-8898-456c-9cd5-5e394344d59d.jpg)

### 배경 색상 / 이미지 관련 속성

#### 배경색

![clip_image016](https://user-images.githubusercontent.com/101630615/173483208-c50bf49d-5467-4600-b61f-06522417deb1.jpg)

#### 배경 이미지 / 반복

![clip_image018](https://user-images.githubusercontent.com/101630615/173483212-9a9fef62-938b-4059-8ab5-6b7b83c59937.jpg)

#### 테두리 속성

\-   테두리의 유형 / 두께 / 색상 지정

![clip_image020](https://user-images.githubusercontent.com/101630615/173483214-e82b136d-b810-48cb-8f83-2032fc551117.jpg)

### 여백 속성 (padding / margin)

![clip_image022](https://user-images.githubusercontent.com/101630615/173483215-18fed505-e3ee-404b-8785-0bccf6d02cc2.jpg)

 

#### Inline, block의 차이

- ``block``
  - 행으로 배치
  - 옆으로 나란히 배치 안 됨
  - 여백 있음 (내용물 외부에 여백 존재)

![clip_image024](https://user-images.githubusercontent.com/101630615/173483216-1c1773d9-a5b4-4b6e-a418-d6f908dc0c6a.jpg)

- ``inline``
  - 옆으로 나란히 배치
  - 여백없이 내용물 만큼만 공간 차지

![clip_image026](https://user-images.githubusercontent.com/101630615/173483219-86d279e4-2591-4528-9dff-d1301b7fb54a.jpg)

- ``inline-block``
  - 인라인, 블록 성격 모두 포함
  - 옆으로 나란히 배치되면서 박스 내부에 여백 존재

![clip_image028](https://user-images.githubusercontent.com/101630615/173483224-9d174321-e2ea-4b86-a308-31c7289a6564.jpg)

#### ``float`` 속성

- 해당 요소를 떠 있게 만드는 속성
- 기본 레이아웃 흐름에서 벗어나 왼쪽이나 오른쪽으로 이동하는 것을 의미
- left : 왼쪽에 배치
- right: 오른쪽에 배치



#### 목록 관련 속성

```
list-style-type : none;
list-style-type : square;
	ul li { display:inline; }
```



### Position 속성

#### static (디폴트)

- 다른 요소와 겹치지 않게 배치
- 위치를 지정하지 않으면 static 적용 (디폴트)

#### relative

- static의 원래 위치를 기준으로 계산

#### absolute

- 가장 가까운 상위 요소(부모)를 기준으로 배치
- 상위 요소가 static인 경우에는 브라우저 화면 기준

#### fixed

- 브라우저 화면을 기준으로 고정 위치에 배치



#### Position 속성 예제

```
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>position 속성</title>
		<style type="text/css">
			#parent { 
				width:200px;
				height:300px;
				border : solid 5px #000;
				margin : 50px 0 0 50px;
			}
				#boxA, #boxB, #boxC { 
					width :80px;
					height:80px;
				}
				
				#boxA { background : #f00; }
				#boxB { background : #0f0; }
				#boxC { background : #ff0; }
		</style>
	</head>
	<body>
		<div id="parent">
			<div id="boxA">A</div>
			<div id="boxB">B</div>
			<div id="boxC">C</div>
		</div>
	</body>
</html>
```



1. #boxB에 relative 위치 지정

```
#boxB { 
	position:relative;
	top:20px;
	left:30px;
}
```

<img  alt="image-20220614135345753" src="https://user-images.githubusercontent.com/101630615/173539984-83eb5629-d396-4976-a5e5-6e335d879851.png">





2. #boxB에 absolute 위치 지정

```
#boxB { 
	position:absolute;
	top:20px;
	left:30px;
}
```



<img  alt="image-20220614135528047" src="https://user-images.githubusercontent.com/101630615/173539986-03178521-0855-4a7e-a420-c2f587a55dea.png">



3.  상위 요소 parent 안으로 배치

   parent의 position을 relative로 설정, boxB를 absolute로 설정

```
#parent { 
	position:relative;
}

#boxB { 
	position:absolute;
	top:20px;
	left:30px;
}
```

<img  alt="image-20220614135602445" src="https://user-images.githubusercontent.com/101630615/173539989-a0cd8bda-ca46-44fc-b12e-2ce4791a669d.png">



#### fixed

지정된 위치에 고정 배치

```
#fixedBox { 
	position:fixed;
	width:50px;
	height:50px;
	background:blue;
	top:50px;
	left:50px;
}
```



#### 레이어(겹침) 표현 속성

- z-index 속성
- 요소들이 겹칠 때 순서 지정
- 나중에 배치하는 것이 위에 놓임
- z-index 값이 클수록 위에 놓음



<img  alt="image-20220614135315522" src="https://user-images.githubusercontent.com/101630615/173539976-d4b24063-1672-447e-9554-396998652165.png">

#### 자식 / 자손 선택자 (상속 선택자)

- 자식 / 자손의 개념

![selector](https://user-images.githubusercontent.com/101630615/173538052-b60fc0a4-5cd7-4c96-ba3d-5dfc25f5a9f8.png)

#### 자식 선택자 : > 부호 사용

- 선택자 > 자식 선택자
- 선택자A > 선택자B
- ``#header > h1``

#### 자손(후손) 선택자 : 띄어 쓰기(간격)

- 선택자 자손선택자
- 선택자A 선택자B
- ``#header h1``
- ``#pageNav ul li a:hover``

#### ``<table>`` 태그에 자식 선택자 사용 시 주의

- ``table > tr > th { color : green; }`` : 적용 안 됨
- 개발자 도구에서 Elements 확인 시 ``<tbody>``태그 존재
- ``table > body > tr > th { color : green; }`` : 적용됨
- 자식 선택자 사용보다는 자손 선택자 사용 추천



#### first-child 선택자

- ``.wrap div:first-child``
- ``.wrap div:first-child + div``



#### nth-child(숫자)

- ``.wrap div:nth-child(1)``
- ``.wrap div:nth-child(2)``
- ``.wrap div:nth-child(3)``



#### 동적(반응) 선택자

- 선택자 :active - 마우스를 클릭한 태그 선택
- 선택자 :hover - 마우스를 올린 태그 선택



#### 가운데 정렬

- 컨테이너 태그 자신을 가운데 정렬

  - ```
    margin : 0 auto; width: 400px;
    ```

- 안에 포함된 내용을 가운데 정렬

  - ```
    text-align:center;
    ```

- **주의!**  ``<table>`` 태그인 경우

  - ```
    margin : 0 auto; width:400px;
    
    margin : 0 auto; 사용할 경우 width 속성 값이 있어야 함
    ```



#### 문서 외부에 CSS 정의

- CSS 파일 인코딩 : UTF-8

  - Window -> Preferences -> Web -> CSS Files
  - Encoding : ISO 10646/Unicode(UTF-8) 선택

- CSS 파일 생성 (.css)

  - New / CSS File
  - File name : cssNthChild.css

- HTML ``<head>``  태그에 작성

  - ```
    link rel="stylesheet" type="text/css" href="경로/파일명.css"
    ```



#### Overflow 속성

- 자식 요소가 부모 요소의 범위를 벗어났을 때

- 어떻게 처리할 것인지 지정

- hidden
  - 부모 영역을 벗어나는 부분은 보이지 않게 처리

- scroll
  - 스크롤바 표시 (가로 / 세로)

- auto
  - 자동으로 필요한 부분에만 스크롤바 표시

#### 투명도(불투명도) / 가시성

- opacity 속성

  - 0 ~ 1 사이의 값 지정

  - 0 : 투명 (안 보임)

  - 1 : 불투명 (보임)

  - 0.5 : 반투명

#### 가시성 (보임 / 안 보임)

- visibility 속성
  - hidden : 숨김 (안 보임)
  - visible : 보임