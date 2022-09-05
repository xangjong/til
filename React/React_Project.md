# [React] 프로젝트 생성



1. reactWorkspace 폴더 생성
2. VSCode : 터미널 / 새 터미널
3. reactWorkspace로 이동
   - ``cd 경로\reactWorkspace``
4. ``npx create-react-app 프로젝트명``
5. my-app 폴더로 이동 : ``cd my-app``
6. 프로젝트 실행 : ``npm start``
7. 실행 종료 : Ctrl + C

- 함수형 컴포넌트 : rsc 입력하고 엔터
- 클래스형 컴포넌트 : rcc 입력하고 엔터





#### 이미지 출력

- (1) public 안에 assets 폴더 생성하고 이미지 파일 저장
  - js파일에서 기본으로 public 경로 찾아감
- (2) src 폴더 안에 images 폴더에 이미지 저장하고  import 해서 사용
- public 폴더 안의 생성된 폴더의 이미지는 import 사용 안 함



#### state 

- 변수 (변경 가능)
- 컴포넌트 내부에서 변경될 수 있는 값
- 이 값이 변경될 때 리 렌더링 됨
- 함수형 컴포넌트에서는 useState() 함수 사용해서 state 값 변경
- Hooks 
  - 기존의 함수형 컴포넌트에서 할 수 없었던 다양한 기능을 제공
  - useState() : 상태 관리
  - useEffect() : 렌더링 직후 작업 설정



##### useState() 사용법

```react
import React, {useState} from ‘react’;
const [state명(변수명), setter함수명] = useState(초기값);
```



#### props

- 컴포넌트의 속성 (값 설정)

- 부모 컴포넌트에서 자식 컴포넌트로 값을 전달할 때 사용 (읽기 전용)

- 컴포넌트 렌더링할 때 값을 전달해 주고 싶을 때 사용

- 부모 컴포넌트 : App.js

- 값을 직접 보내도 되고, 변수의 값을 보내도 됨

- ``<Subject title="제목"></Subject>`` 또는 

- ``let title = “제목”;``

- ``<Subject title={title}></Subject>``

- 자식 컴포넌트에서 받음 : Subject.js

  ```react
  const Subject = ({title}) => {
  … {title} 
  }
  ```





