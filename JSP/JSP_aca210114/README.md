## 21. 01. 14 학원 JSP 수업

- JSP의 Directive Tag에 대해 배우고, JSP 코드 내에서 배열을 선언하고 순회하는 문제를 풀었습니다. [링크](https://github.com/JooMal/withBackendRoadmap/tree/main/JSP/JSP_aca210114/WebContent/jspDirectiveTagsAndTestArray)
- Directive Tag 중 Action Tag에 대해 배우고, [Forward action](https://github.com/JooMal/withBackendRoadmap/tree/main/JSP/JSP_aca210114/WebContent/actionForwardTest)과
[Param action](https://github.com/JooMal/withBackendRoadmap/tree/main/JSP/JSP_aca210114/WebContent/actionParam)을 공부했습니다.
- include directvie tag를 사용해 header와 footer를 넣어보았습니다. [링크](https://github.com/JooMal/withBackendRoadmap/tree/main/JSP/JSP_aca210114/WebContent/makeHeaderAndFooter)
- include directive tag와 page directive tag를 사용해 상단 네비게이션과 footer는 include로, 메인에선 page import로 Date함수를 가져와 SimpleDateFormat을 사용해 현재 시각을 출력했습니다. [링크](https://github.com/JooMal/withBackendRoadmap/tree/main/JSP/JSP_aca210114/WebContent/WelcomePageWithCurrentTime)
- JavaBeans를 사용해 간단히 생년월일과 이름을 memberBean에서 받아와 출력해보았습니다. [jsp파일](https://github.com/JooMal/withBackendRoadmap/blob/main/JSP/JSP_aca210114/WebContent/useBean01.jsp), [bean파일](https://github.com/JooMal/withBackendRoadmap/tree/main/JSP/JSP_aca210114/src/com/dao)

---

### 디렉티브 태그 Directive Tag
- 문서를 어떻게 처리할 것인지 나타내는 태그
- 페이지와 관련된 정보를 JSP 컨테이너에게 보내는 일종의 메시지
- page 디렉티브 : 페이지와 관련된 다양한 속성, 기능을 지정
 - language : 스크립트 언어 이름
 - contentType : JSP 페이지가 생성하는 문서의 타입을 나타내기 위하여 사용
    - charset : JSP페이지에서 사용하는 문자 지정
- include 디렉티브 : 특정 영역에 다른 문서를 포함한다.
- taglib 디렉티브 : JSP 페이지에서 사용할 태그 라이브러리를 설정한다.

### 액션태그
- 서버나 클라이언트에게 어떤 행동을 하도록 명령하는 태그.
- JSP페이지에서 페이지와 페이지 사이를 제어한다.
- 다른 페이지의 실행 결과 내용을 현재 페이지에 포함시킨다.
- 자바빈즈 등의 다양한 기능을 제공한다.
- <jsp:.../> 으로 사용
   - />로 </jsp:...> 을 대체할 수 있다.
   
### forward 액션 태그
- 현재 페이지에서 다른 페이지로 이동하는 태그
   - <jsp:forward page = "파일명" /> or </jsp:forward>
   
### page 속성 값
- 현재 jsp페이지에서 이동할 페이지의 외부 파일명
- 외부 파일은 현재 jsp페이지와 같은 디렉터리에 있으면 파일명만 설정하고, 그렇지 않으면 전체 url 또는 상대경로를 설정해야함.

### 자바빈즈(java beans)
- JSP, 페이지에서 사용할 수 있는 일종의 객체.
- 매개변수가 없는 기본 생성자가 반드시 있어야 한다.
- 모든 변수들은 private 접근으로 무조건 설정해야 한다. 외부에서 직접적으로 데이터를 건들지 못하도록.
- getter와 setter 메서드가 존재한다.
	- getter() 메서드는 멤버 변수에 저장되어있는 값을 가져올 수 있다.
	- setter() 메서드는 멤버 변수에 값을 저장할 수 있는 메서드이다.
- 패키지화 : 자바빈즈는 반드시 패키지가 있어야 한다. default package 안에 있으면 안된다.
- 객체 생성 : <jsp:useBean>를 호출하는데, 이는 기본 생성자를 사용하는 액션태그이다.

### 자바빈즈의 장점
- 폼 태그 처리에 좋다. 많은 파라미터가 넘어올 때 자바빈즈에 담아 한 번에 사용하거나 전달할 수 있다.
- 재사용성이 좋다. : 한 번 만들어둔 자바빈즈를 다른 페이지에서도 계속 사용할 수 있다.

### <useBean>
- jsp페이지에서 실제 자바 클래스를 선언하고, 초기화하는 태그이다.
- id 속성과 scope 속성을 바탕으로 자바빈즈의 객체를 검색하고, 객체가 발견되지 않으면 빈 객체를 생성한다.
- id = 자바빈즈를 식별하기 위한 이름
- class = 패키지의 이름
- scope = 자바 빈즈가 저장되는 영역을 설정한다. (session, application 등)
