## [1] Git 초기 설정

> 최초 한 번만 설정합니다. 매번 Git을 사용할 때마다 설정할 필요가 없습니다.

1. 누가 커밋 기록을 남겼는지 확인할 수 있도록 이름과 이메일을 설정

   작성자를 수정하고 싶을 때에는 이름, 메일 주소만 다르게 하여 동일하게 입력

   ```
   $ git config --global user.name "이름"
   $ git config --global user.email "메일 주소"
   ```

2. 작성자가 올바르게 설정되었는지 확인 가능합니다.

   ```
   $ git config --global -l
   
   또는
   
   $ git config --global --list
   ```

## [2] Git 기본 명령어

### (0) 로컬 저장소

- `Working Directory (= Working Tree)` : 사용자의 일반적인 작업이 일어나는 곳
- `Staging Area (= Index)` : 커밋을 위한 파일 및 폴더가 추가되는 곳
- `Repository` : staging area에 있던 파일 및 폴더의 변경사항(커밋)을 저장하는 곳
- Git은 **Working Directory → Staging Area → Repository** 의 과정으로 버전 관리를 수행합니다.

### (1) git init

```
$ git init
Initialized empty Git repository in C:/Users/kyle/git-practice/.git/

kyle@KYLE MINGW64 ~/git-practice (master)
```

- 현재 작업 중인 디렉토리를 Git으로 관리한다는 명령어
- `.git` 이라는 숨김 폴더를 생성하고, 터미널에는 `(master)`라고 표기됩니다.
- Mac OS의 경우 `(master)`가 표기되지 않는데, Terminal 업그레이드를 통해 표기할 수 있습니다.

❗

 **주의 사항**

1. 이미 Git 저장소인 폴더 내에 또 다른 Git 저장소를 만들지 않습니다. (중첩 금지) 즉, 터미널에 이미 (master)가 있다면, git init을 절대 입력하면 안됩니다.
2. 절대로 홈 디렉토리에서 git init을 하지 않습니다. 터미널의 경로가 `~` 인지 확인합니다.

### (2) git status

```
$ git status
On branch master

No commits yet

nothing to commit (create/copy files and use "git add" to track)
```

- Working Directory와 Staging Area에 있는 파일의 현재 상태를 알려주는 명령어

- 어떤 작업을 시행하기 전에 수시로 status를 확인하면 좋습니다.

- 상태

  1. `Untracked` : Git이 관리하지 않는 파일 (한번도 Staging Area에 올라간 적 없는 파일)

  2. ```
     Tracked
     ```

     : Git이 관리하는 파일

     1. `Unmodified` : 최신 상태
     2. `Modified` : 수정되었지만 아직 Staging Area에는 반영하지 않은 상태
     3. `Staged` : Staging Area에 올라간 상태

### (3) git **add**

```
# 특정 파일
$ git add a.txt

# 특정 폴더
$ git add my_folder/

# 현재 디렉토리에 속한 파일/폴더 전부
$ git add .
```

- Working Directory에 있는 파일을 Staging Area로 올리는 명령어

- Git이 해당 파일을 추적(관리)할 수 있도록 만듭니다.

- `Untracked, Modified → Staged` 로 상태를 변경합니다.

- 예시

  ```
  $ touch a.txt b.txt
  
  $ git status
  On branch master
  
  No commits yet
  
  Untracked files: # 트래킹 되고 있지 않는 파일 목록
    (use "git add <file>..." to include in what will be committed)
          a.txt
          b.txt
  
  nothing added to commit but untracked files present (use "git add" to track)
  ```

  ```
  # a.txt만 Staging Area에 올립니다.
  
  $ git add a.txt
  ```

  ```
  $ git status
  
  On branch master
  
  No commits yet
  
  Changes to be committed: # 커밋 예정인 변경사항(Staging Area)
    (use "git rm --cached <file>..." to unstage)
          new file:   a.txt
  
  Untracked files: # 트래킹 되고 있지 않은 파일
    (use "git add <file>..." to include in what will be committed)
          b.txt
  ```

### (4) git **commit**

```
$ git commit -m "first commit"
[master (root-commit) c02659f] first commit
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 a.txt
```

- Staging Area에 올라온 파일의 변경 사항을 하나의 버전(커밋)으로 저장하는 명령어
- `커밋 메세지`는 현재 변경 사항들을 잘 나타낼 수 있도록 `의미` 있게 작성하는 것을 권장합니다.
- 각각의 커밋은 `SHA-1` 알고리즘에 의해 반환 된 고유의 해시 값을 ID로 가집니다.
- `(root-commit)` 은 해당 커밋이 최초의 커밋 일 때만 표시됩니다. 이후 커밋부터는 사라집니다.

### (5) **git log**

```
$ git log
commit 1870222981b4731d14ef91d401c68c0bbb2f6e7d (HEAD -> master)
Author: kyle <kyle123@hphk.kr>
Date:   Thu Dec 9 15:26:46 2021 +0900

    first commit
```

- 커밋의 내역(`ID, 작성자, 시간, 메세지 등`)을 조회할 수 있는 명령어
- 옵션
  - `--oneline` : 한 줄로 축약해서 보여줍니다.
  - `--graph` : 브랜치와 머지 내역을 그래프로 보여줍니다.
  - `--all` : 현재 브랜치를 포함한 모든 브랜치의 내역을 보여줍니다.
  - `--reverse` : 커밋 내역의 순서를 반대로 보여줍니다. (최신이 가장 아래)
  - `-p` : 파일의 변경 내용도 같이 보여줍니다.
  - `-2` : 원하는 갯수 만큼의 내역을 보여줍니다. (2 말고 임의의 숫자 사용 가능)

**옵션과 인자**

**옵션**은 명령어의 동작 방식을 지정하는 것입니다. 따라서 **생략 가능**합니다. 단순히 기존 기능보다 부가 적인 기능을 원할 때 사용합니다. 예를 들면 `git log --oneline`은 커밋 내역을 한 줄로 보고 싶을 때 사용합니다. `oneline` 옵션은 말 그대로 부가 적인 기능이므로, 생략해도 `git log`는 정상 동작 합니다.

**인자**는 명령어의 동작 대상을 지정하는 것입니다. 따라서 **생략이 불가능** 합니다. 예를 들면 `git add` 라고만 작성하면 어떤 파일을 Staging Area에 올릴지 모르게 됩니다. 반드시 `git add a.txt` 와 같이 git add 명령어가 동작할 대상을 지정해야 하는데 이때 `a.txt`와 같은 대상을 인자라고 합니다.

------

## [1] 원격 저장소 (Remote Repository)

### (1) Github에서 원격 저장소 생성

화면 오른쪽 상단 더하기(+) 버튼을 누르고 New repository를 클릭합니다.

저장소의 이름, 설명, 공개 여부를 선택하고 Create repository를 클릭합니다. (체크 박스는 건드리지 않습니다!)

### (2) 로컬 저장소와 원격 저장소 연결

1. 원격 저장소가 잘 생성되었는지 확인 후, 저장소의 주소를 복사합니다.

2. 기존에 실습 때 만들었던 홈 디렉토리의 TIL 폴더로 가서 vscode를 엽니다.

3. git init을 통해 TIL 폴더를 로컬 저장소로 만들어줍니다.

   ```
   kyle@KYLE MINGW64 ~/TIL
   $ git init
   Initialized empty Git repository in C:/Users/kyle/TIL/.git/
   ```

4. **git remote**

   로컬 저장소에 원격 저장소를 `등록, 조회, 삭제`할 수 있는 명령어

   1. **등록**

      `git remote add <이름> <주소>` 형식으로 작성합니다.

      ```
      $ git remote add origin <https://github.com/edukyle/TIL.git>
      
      [풀이]
      git 명령어를 작성할건데, remote(원격 저장소)에 add(추가) 한다.
      origin이라는 이름으로 <https://github.com/edukyle/TIL.git라는> 주소의 원격 저장소를
      ```

   2. **조회**

      `git remote -v` 로 작성합니다.

      ```
      $ git remote -v
      origin  <https://github.com/edukyle/TIL.git> (fetch)
      origin  <https://github.com/edukyle/TIL.git> (push)
      
      add를 이용해 추가했던 원격 저장소의 이름과 주소가 출력됩니다.
      ```

   3. **삭제**

      `git remote rm <이름>` 혹은 `git remote remove <이름>` 으로 작성합니다.

      > 로컬과 원격 저장소의 연결을 끊는 것이지, 원격 저장소 자체를 삭제하는 게 아닙니다.

      ```
      $ git remote rm origin
      $ git remote remove origin
      
      [풀이]
      git 명령어를 작성할건데, remote(원격 저장소)와의 연결을 rm(remove, 삭제) 한다.
      그 원격 저장소의 이름은 origin이다.
      ```

### (3) 원격 저장소에 업로드

- 실습 때 작성했던 TIL 파일을 Github 원격 저장소에 업로드 해보겠습니다.
- **정확히 말하면, 파일을 업로드하는 게 아니라 커밋을 업로드 하는 것입니다.**
- 따라서 먼저 로컬 저장소에서 커밋을 생성해야 원격 저장소에 업로드 할 수 있습니다.

1. **로컬 저장소에서 커밋 생성**

   ```
   # 현재 상태 확인
   
   $ git status
   On branch master
   
   No commits yet
   
   Untracked files:
     (use "git add <file>..." to include in what will be committed)
           day1.md
   
   nothing added to commit but untracked files present (use "git add" to track)
   ```

   ```
   $ git add day1.md
   ```

   ```
   $ git commit -m "Upload TIL Day1"
   [master (root-commit) f3d6d42] Upload TIL Day1
    1 file changed, 0 insertions(+), 0 deletions(-)
    create mode 100644 day1.md
   ```

   ```
   # 커밋 확인
   
   $ git log --oneline
   f3d6d42 (HEAD -> master) Upload TIL Day1
   ```

2. **git push**

   - 로컬 저장소의 커밋을 원격 저장소에 업로드하는 명령어
   - `git push <저장소 이름> <브랜치 이름>` 형식으로 작성합니다.
   - `-u` 옵션을 사용하면, 두 번째 커밋부터는 `저장소 이름, 브랜치 이름`을 생략 가능합니다.

   ```
   $ git push origin master
   
   [풀이]
   git 명령어를 사용할건데, origin이라는 이름의 원격 저장소의 master 브랜치에 push 한다.
   
   ------------------------------------------------
   
   $ git push -u origin master
   이후에는 $ git push 라고만 작성해도 push가 됩니다.
   ```

3. **vscode 자격 증명**

   이후 git push 완료

   ```
   $ git push -u origin master
   info: please complete authentication in your browser...
   Enumerating objects: 3, done.
   Counting objects: 100% (3/3), done.
   Writing objects: 100% (3/3), 218 bytes | 218.00 KiB/s, done.
   Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
   To <https://github.com/edukyle/TIL.git>
    * [new branch]      master -> master
   Branch 'master' set up to track remote branch 'master' from 'origin'.
   ```

4. **원격 저장소에서 정상 업로드 확인**

   ❗ **(주의) Github 원격 저장소에 절대로 파일을 드래그해서 업로드 하지 않습니다!!!!**

가끔 Github를 구글 드라이브처럼 여겨서, 파일을 직접 드래그해서 올리는 경우가 있습니다. Git 명령어를 학습했기 때문에, 반드시 git add → git commit → git push 의 단계로만 업로드 해야합니다.

그 이유는 로컬 저장소와 원격 저장소의 동기화 때문입니다. 로컬 저장소에서 변경이 먼저 일어나고, 그 변경 사항을 원격 저장소에 반영하는 형태여야 합니다. 하지만, Github에 드래그를 해서 파일을 업로드하면 원격 저장소에 변경이 먼저 일어나는 형태가 되기 때문에 이러한 행동을 지양해야 합니다.

## [2] 실습

### (1) [README.md](http://readme.md/) 파일 push 해보기

- `README.md`는 원격 저장소의 소개와 설명이 담겨있는 일종의 대문 역할을 합니다.
- 반드시 파일 이름을 `README.md`로 지정해야 Github가 인식할 수 있습니다.
- 홈 디렉토리에 있는 TIL 폴더에 `README.md` 파일을 생성하고, 자유롭게 `설명, 각오, 분류 등`을 마크다운 문법으로 작성하고 자신의 Github TIL 원격 저장소에 push를 해봅니다.
- 

------

## [1] .gitignore

> 특정 파일 혹은 폴더에 대해 Git이 버전 관리를 하지 못하도록 지정하는 것

### (1) .gitignore에 작성하는 목록

- 민감한 개인 정보가 담긴 파일 (전화번호, 계좌번호, 각종 비밀번호, API KEY 등)
- OS(운영체제)에서 활용되는 파일
- IDE(통합 개발 환경 - pycharm) 혹은 Text editor(vscode) 등에서 활용되는 파일
  - 예) pycharm -> .idea/
- 개발 언어(python) 혹은 프레임워크(django)에서 사용되는 파일
  - 가상 환경 : `venv/`
  - `__pycache__/`

### (2) .gitignore 작성 시 주의 사항

- 반드시 이름을 `.gitignore`로 작성합니다. 앞의 점(.)은 숨김 파일이라는 뜻입니다.

- `.gitignore` 파일은 `.git` 폴더와 동일한 위치에 생성합니다.

- **제외 하고 싶은 파일은 반드시 `git add` 전에 `.gitignore`에 작성합니다.**

  ❗

   

  **왜 git add 전에 .gitignore에 작성해야 할까요?**

  `git add a.txt` 라고 작성하면, 이제 Git은 `a.txt`를 버전 관리의 대상으로 여깁니다. 한 번 버전 관리의 대상이 된 `a.txt`는 이후에 .gitignore에 작성하더라도 무시되지 않고 계속 버전 관리의 대상으로 인식됩니다.

  따라서 제외 하고 싶은 파일은 반드시 git add 전에 .gitignore에 작성해야 합니다!

### (3) .gitignore 쉽게 작성하기

> .gitignore의 내용을 쉽게 작성할 수 있도록 도와주는 두 개의 사이트를 소개합니다. 자신의 개발 환경에 맞는 것을 찾아서 `전체 복사, 붙여넣기`를 하면 됩니다.

1. **웹사이트**

[gitignore.io](https://gitignore.io/)

1. **gitignore 저장소**

https://github.com/github/gitignore

1. **Python에 대한 .gitignore 예시**

   https://gitignore.io/

## [2] 심화

### (1) .gitignore 패턴 규칙

1. 아무것도 없는 라인이나, `#`로 시작하는 라인은 무시합니다.
2. `슬래시(/)`로 시작하면 하위 디렉터리에 재귀적으로 적용되지 않습니다.
3. 디렉터리는 `슬래시(/)`를 끝에 사용하는 것으로 표현합니다.
4. `느낌표(!)`로 시작하는 패턴의 파일은 ignore(무시)하지 않습니다.
5. 표준 Glob 패턴을 사용합니다.
   - `*(asterisk)`는 문자가 하나도 없거나 하나 이상을 의미합니다.
   - `[abc]`는 중괄호 안에 있는 문자 중 하나를 의미합니다.
   - `물음표(?)`는 문자 하나를 의미합니다.
   - `[0-9]`처럼 중괄호 안에 하이픈(-)이 있는 경우 0에서 9사이의 문자 중 하나를 의미합니다.
   - `**(2개의 asterisk)`는 디렉터리 내부의 디렉터리까지 지정할 수 있습니다. (`a/**/z`라고 작성하면 `a/z`, `a/b/z`, `a/b/c/z` 까지 모두 영향을 끼칩니다.)

### (2) 패턴 예시

```
# .gitignore

# 확장자가 txt인 파일 무시
*.txt

# 현재 확장자가 txt인 파일이 무시되지만, 느낌표를 사용하여 test.txt는 무시하지 않음
!test.txt

# 현재 디렉터리에 있는 TODO 파일은 무시하고, folder/TODO 처럼 하위 디렉터리에 있는 파일은 무시하지 않음
/TODO

# build/ 디렉터리에 있는 모든 파일은 무시
build/

# folder/notes.txt 파일은 무시하고 folder/child/arch.txt 파일은 무시하지 않음
folder/*.txt

# folder 디렉터리 아래의 모든 .pdf 파일을 무시
folder/**/*.pdf
```

------

## [1] 원격 저장소 가져오기

### (1) git clone

- 원격 저장소의 커밋 내역을 모두 가져와서, 로컬 저장소를 생성하는 명령어

- clone은 `"복제"`라는 뜻으로, `git clone` 명령어를 사용하면 원격 저장소를 통째로 복제해서 내 컴퓨터에 옮길 수 있습니다.

- `git clone <원격 저장소 주소>`의 형태로 작성합니다.

  ```
  $ git clone <https://github.com/edukyle/TIL.git>
  Cloning into 'TIL'...
  remote: Enumerating objects: 3, done.
  remote: Counting objects: 100% (3/3), done.
  remote: Total 3 (delta 0), reused 3 (delta 0), pack-reused 0
  Receiving objects: 100% (3/3), done.
  ```

  위에 작성한 대로 실행하면, `Github의 edukyle이라는 계정의 TIL 원격 저장소를 복제`하여 내 컴퓨터에 TIL이라는 이름의 로컬 저장소를 생성하게 됩니다.

- git clone을 통해 생성된 로컬 저장소는 `git init`과 `git remote add`가 이미 수행되어 있습니다.

### (2) git pull

- 원격 저장소의 변경 사항을 가져와서, 로컬 저장소를 업데이트하는 명령어

- 로컬 저장소와 원격 저장소의 내용이 완전 일치하면 git pull을 해도 변화가 일어나지 않습니다.

- `git pull <저장소 이름> <브랜치 이름>`의 형태로 작성합니다.

  ```
  $ git pull origin master
  From <https://github.com/edukyle/git-practice>
   * branch            master     -> FETCH_HEAD
  Updating 6570ecb..56809a9
  Fast-forward
   README.md | 1 +
   1 file changed, 1 insertion(+)
  
  [풀이]
  git 명령어를 사용할건데, origin이라는 원격 저장소의 master 브랜치의 내용을 가져온다(pull).
  ```

💡

 **git clone vs git pull**

clone과 pull이 모두 원격 저장소로부터 가져오는 명령어라서 조금 혼동될 수 있습니다.

`git clone`은 git init처럼 처음에 한 번만 실행합니다. 즉 로컬 저장소를 만드는 역할이죠. 단, git init처럼 직접 로컬 저장소를 만드는 게 아니라, Github에서 저장소를 복제해서 내 컴퓨터에 똑같은 복제본을 만든다는 차이가 있습니다.

`git pull`은 git push처럼 로컬 저장소와 원격 저장소의 내용을 동기화하고 싶다면 언제든 사용합니다. 단, push는 로컬 저장소의 변경 내용을 원격 저장소에 반영하는 것이고, pull은 원격 저장소의 변경 내용을 로컬 저장소에 반영하는 것입니다. **즉 방향이 다릅니다!**

## [2] 내 컴퓨터 ↔ Github(원격 저장소) ↔ 강의장 컴퓨터 (예시)

> 두 개 이상의 로컬 저장소에서 하나의 원격 저장소에 접근하면 어떻게 될까요? 집과 강의장을 오가면서 `clone, push, pull` 하는 과정을 살펴보겠습니다.

### (1) 규칙

- 수업 때는 두 개의 폴더를 `"내 컴퓨터"`와 `"강의장 컴퓨터"` 라고 가정합니다.
- 내 컴퓨터에 있는 로컬 저장소의 이름은 `TIL-home` 입니다.
- 강의장 컴퓨터에 있는 로컬 저장소의 이름은 `TIL-class` 입니다.
- Github에 있는 원격 저장소의 이름은 `TIL-remote` 입니다.

### (2) 사전 세팅

- 홈 디렉토리 안에 `TIL-home` 폴더를 생성합니다.

- Github에서 `TIL-remote` 라는 이름의 원격 저장소를 생성합니다.

- `TIL-home` 폴더에서 vscode를 엽니다.

- 아래와 같은 절차를 진행합니다.

  ```
  # TIL-home
  
  $ git init
  $ touch day1.md
  $ git add .
  $ git commit -m "집에서 Day1 작성"
  $ git remote add origin <https://github.com/edukyle/TIL-remote.git>
  $ git push origin master
  ```

  `TIL-home` 로컬 저장소의 내용이 `TIL-remote` 원격 저장소에 그대로 반영되었습니다.

### (3) git clone

> 여러분은 이제 강의장에 왔습니다. 강의장 컴퓨터에는 여러분의 TIL 폴더가 없습니다.

- Github에 있는 `TIL-remote`에서 `git clone`을 통해 내려 받습니다.

  ```
  # TIL-class
  
  $ git clone <https://github.com/edukyle/TIL-remote.git> TIL-class
  ```

  **원격 저장소는 `TIL-remote` 이지만, 위와 같이 작성하면 강의장 컴퓨터에는 `TIL-class`라는 이름으로 로컬 저장소가 생성됩니다. (내부 파일 내용은 똑같습니다. 단지 폴더의 이름만 바뀝니다.)**

### (4) git push

> 강의장 컴퓨터 → 원격 저장소

- 강의장에서 새로운 파일을 만들고 원격 저장소에 업로드 합니다.

  ```
  # TIL-class
  
  $ touch day2.md
  $ git add .
  $ git commit -m "강의장에서 Day2 작성"
  $ git push origin master
  ```

### (5) git pull

> 원격 저장소 → 내 컴퓨터

- 내 컴퓨터에는 day2.md가 없습니다. 왜냐하면 강의장 컴퓨터에서 day2.md를 만들어서 원격 저장소에 push 했기 때문입니다. 따라서 원격 저장소에서 day2.md에 대한 내역을 가져와야 합니다.

  ```
  # TIL-home
  
  $ git pull origin master
  ```

- 이제 `내 컴퓨터, Github, 강의장 컴퓨터`의 내용은 동일합니다.

- **주의 사항 **❗

   

  **만약 TIL-home에서 pull이 아니라 commit을 먼저한 후 pull을 하면 어떻게 될까요? 다음 세 가지의 경우가 있을 수 있습니다.**

  1. 내 컴퓨터와 강의장 컴퓨터에서 **서로 다른 파일을 수정**한 경우 → 정상적으로 git pull이 됩니다.
  2. 내 컴퓨터와 강의장 컴퓨터에서 **같은 파일을 수정했지만, 수정한 라인이 다른** 경우 → 정상적으로 git pull이 됩니다.
  3. 내 컴퓨터와 강의장 컴퓨터에서 **같은 파일의 같은 라인**을 수정한 경우 → **충돌(conflict)**이 발생합니다. 어느 내용을 반영할지 직접 선택해야 합니다.

  ❗

   

  **만약 TIL-home에서 pull이 아니라 commit을 먼저한 후 바로 push 하면 어떻게 될까요?** **아래와 같은 에러 메시지가 나타나면서 push가 실패합니다.**

  To https://github.com/edukyle/TIL-remote.git

  ! [rejected] master -> master (non-fast-forward)

  error: failed to push some refs to 'https://github.com/edukyle/TIL-remote.git'

  원격 저장소의 내용을 먼저 받아오지 않고, 로컬 저장소에서 새로운 커밋을 생성했기 때문에 서로의 커밋 내역이 달라져서 그렇습니다.

  만약 로컬 저장소와 원격 저장소의 내용이 다르다면 일단 git pull을 통해 동기화를 시키고 새로운 커밋을 쌓아 나가야 합니다.

  ------

  ## [1] Branch

  > Git에서 Branch라는 개념은 매우 중요합니다. 사실상 버전 관리의 꽃이라고 할 수 있습니다.

  ### (1) Branch란?

  - Branch는 `나뭇가지`라는 뜻의 영어 단어입니다.
  - 즉 `브랜치`란 나뭇가지처럼 여러 갈래로 작업 공간을 나누어 **독립적으로 작업**할 수 있도록 도와주는 Git의 도구입니다.
  - 장점
    1. 브랜치는 독립 공간을 형성하기 때문에 원본(master)에 대해 안전합니다.
    2. 하나의 작업은 하나의 브랜치로 나누어 진행되므로 체계적인 개발이 가능합니다.
    3. 특히나 Git은 브랜치를 만드는 속도가 굉장히 빠르고, 용량도 적게 듭니다.
  - 그래도 브랜치 꼭 써야하나요?
    1. 일단 master 브랜치는 상용을 의미합니다. 그래서 언제든 세상에 공개되어 있습니다.
    2. 만약 상용에 에러가 있어서 고쳐야 한다면 어떻게 해야할까요?
    3. 고객들이 사용하고 있는데, 함부로 버전을 되돌리거나 삭제할 수 있을까요?
    4. 따라서 브랜치를 통해 별도의 작업 공간을 만들고, 그곳에서 되돌리거나 삭제를 합니다.
    5. 브랜치는 완전하게 독립이 되어있어서 어떤 작업을 해도 master에는 영향을 끼치지 못하죠.
    6. 그리고 이후에 에러를 해결했다면? 그 내용을 master에 반영할 수도 있습니다!
    7. 이러한 이유 때문에 Git에서 브랜치는 정말 강력한 기능 중의 하나라고 할 수 있습니다.

  ### (2) git branch

  > 브랜치 `조회, 생성, 삭제 등` 브랜치와 관련된 Git 명령어

  ```
  # 브랜치 목록 확인
  $ git branch
  
  # 원격 저장소의 브랜치 목록 확인
  $ git branch -r
  
  # 새로운 브랜치 생성
  $ git branch <브랜치 이름>
  
  # 특정 커밋 기준으로 브랜치 생성
  $ git branch <브랜치 이름> <커밋 ID>
  
  # 특정 브랜치 삭제
  $ git branch -d <브랜치 이름> # 병합된 브랜치만 삭제 가능
  $ git branch -D <브랜치 이름> # (주의) 강제 삭제 (병합되지 않은 브랜치도 삭제 가능)
  ```

  ### (3) git switch

  > 현재 브랜치에서 다른 브랜치로 `HEAD`를 이동시키는 명령어 `HEAD`란 현재 브랜치를 가리키는 포인터를 의미합니다.

  ```
  # 다른 브랜치로 이동
  $ git switch <다른 브랜치 이름>
  
  # 브랜치를 새로 생성과 동시에 이동
  $ git switch -c <브랜치 이름>
  
  # 특정 커밋 기준으로 브랜치 생성과 동시에 이동
  $ git switch -c <브랜치 이름> <커밋 ID>
  ```

   

  **git switch 하기 전에, 해당 브랜치의 변경 사항을 커밋 하셨나요?**

  master 브랜치와 feature 브랜치가 있다고 가정해보겠습니다. feature 브랜치에서 test.txt를 만들고 git commit 하지 않은 상황에서 master 브랜치로 이동하게 되면, test.txt 파일이 그대로 남아있습니다.

  따라서 브랜치를 이동하기 전에, 꼭 커밋을 완료하고 이동하도록 합니다.

  ## [2] Branch scenario

  > git branch와 git switch를 통해 브랜치를 `조회, 생성, 이동`하는 실습을 진행합니다.

  ### (1) 사전 세팅

  1. 홈 디렉토리에 `git-branch-practice` 폴더를 생성하고 이동 후 vscode를 엽니다.

     ```
     $ mkdir git-branch-practice
     $ cd git-branch-practice
     $ code .
     ```

  2. Git 저장소를 생성합니다.

     ```
     $ git init
     Initialized empty Git repository in C:/Users/kyle/git-branch-practice/.git/
     ```

  3. `test.txt`를 생성하고 각각 `master-1, master-2, master-3` 이라는 내용을 순서대로 입력하여 커밋 3개를 작성합니다.

     ```
     $ touch test.txt
     
     test.txt에 master-1 작성
     $ git add .
     $ git commit -m "master-1"
     
     test.txt에 master-2 작성
     $ git add .
     $ git commit -m "master-2"
     
     test.txt에 master-3 작성
     $ git add .
     $ git commit -m "master-3"
     ```

  4. `git log --oneline`을 입력했을 때 아래와 같이 나와야 정상입니다.

     총 3개의 버전이 master 브랜치에 만들어졌습니다.

     ```
     $ git log --oneline
     0604dcd (HEAD -> master) master-3
     9c22c89 master-2
     3d71510 master-1
     ```

  5. 현재까지 결과

  ### (2) 브랜치 생성, 조회

  1. 현재 위치(master 브랜치의 최신 커밋)에서 `login`이라는 이름으로 브랜치를 생성합니다.

     ```
     $ git branch login
     ```

  2. login브랜치가 잘 생성되었는지 확인합니다.

     `* master`의 의미는 현재 HEAD가 가리키는 브랜치는 `master`라는 것입니다.

     ```
     $ git branch
     	login
     * master
     ```

  3. `git log --oneline`을 입력했을 때 아래와 같이 나와야 정상입니다.

     `0604dcd` 커밋 기준으로 `master`와 `login`브랜치가 위치한 것을 볼 수 있습니다.

     ```
     $ git log --oneline
     0604dcd (HEAD -> master, login) master-3
     9c22c89 master-2
     3d71510 master-1
     ```

  4. `master` 브랜치에서 1개의 커밋을 더 작성합니다.

     ```
     test.txt에 master-4 작성
     $ git add .
     $ git commit -m "master-4"
     ```

  ### (3) 브랜치 이동

  1. 현재 브랜치와 커밋의 상태는 다음과 같습니다.

     ```
     $ git log --oneline
     5ca7701 (HEAD -> master) master-4
     0604dcd (login) master-3
     9c22c89 master-2
     3d71510 master-1
     ```

  2. 이때 `login`브랜치로 이동하면 어떤 일이 일어날까요?

     ```
     $ git switch login
     ```

     **master 브랜치의 test.txt에 작성한 master-4가 지워졌습니다!!**

     ```
     # login 브랜치의 test.txt
     
     master-1
     master-2
     master-3
     ```

  3. 그리고 `git log --oneline`을 입력하면 아래와 같이 나타납니다.

     이제 `HEAD`는 `login` 브랜치를 가리키고, `master` 브랜치가 보이지 않습니다.

     ```
     $ git log --oneline
     0604dcd (HEAD -> login) master-3
     9c22c89 master-2
     3d71510 master-1
     ```

  4. master 브랜치는 삭제된 걸까요?

     아닙니다! 브랜치를 조회 해보면 다음과 같이 나타납니다.

     HEAD가 `login` 브랜치를 가리키면서, log도 `login` 브랜치 기준으로 보이는 것이었습니다.

     ```
     $ git branch
     * login
       master
     ```

  5. `git log --oneline --all`을 입력하면 모든 브랜치의 로그를 볼 수 있습니다.

     ```
     $ git log --oneline --all
     5ca7701 (master) master-4
     0604dcd (HEAD -> login) master-3
     9c22c89 master-2
     3d71510 master-1
     ```

  💡 

  즉 브랜치를 이동한다는건 HEAD가 해당 브랜치를 가리킨다는 것을 의미하고 브랜치는 최신 커밋을 가리키므로, **HEAD가 해당 브랜치의 최신 커밋을 가리키게 됩니다.

  따라서 워킹 디렉토리의 내용도 HEAD가 가리키는 브랜치의 최신 커밋 상태로 변화합니다.**

  ### (4) login 브랜치에서 커밋 생성

  1. `test.txt` 파일에 `login-1`이라고 작성합니다.

     ```
     # login 브랜치의 test.txt
     master-1
     master-2
     master-3
     login-1
     ```

  2. 추가적으로 `test_login.txt`도 생성하고 `login-1`이라고 작성해봅시다.

     ```
     $ touch test_login.txt
     
     # 이후 test_login.txt에 작성
     login-1
     ```

  3. 커밋을 생성합니다.

     ```
     $ git add .
     $ git commit -m "login-1"
     ```

  4. `git log --oneline --all --graph`를 통해 아래와 같은 내용을 확인합니다.

     `master` 브랜치와 `login` 브랜치가 다른 갈래로 갈라진 것을 확인할 수 있습니다.

     ```
     $ git log --oneline --graph --all
     * 3b0a091 (HEAD -> login) login-1
     | * 5ca7701 (master) master-4
     |/
     * 0604dcd master-3
     * 9c22c89 master-2
     * 3d71510 master-1
     ```

