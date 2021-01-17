# Basic Spring

인프런 [스프링 핵심 원리 기본편](https://www.inflearn.com/course/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%95%B5%EC%8B%AC-%EC%9B%90%EB%A6%AC-%EA%B8%B0%EB%B3%B8%ED%8E%B8)의 섹션 1을 수강한 코드입니다.  
해당 강의는 `스프링`을 도입하기에 앞서, 직접 자바 코드로 객체지향적인 코드를 작성해보며  
어떠한 문제점을 해결하고자 `스프링`이 도입되었는지를 알아보고자 합니다.  

---

# What I Learned

### Java Enum
- java enum에 대해서 공부했습니다. 관련하여 **우아한형제들 기술블로그**의 [Java Enum 활용기](https://woowabros.github.io/tools/2017/07/10/java-enum-uses.html)를 읽고 공부하였습니다.
    - enum type 변수는 stack 영역에 생성됩니다. 해당 강의에서 사용된 Grade를 예시로 들어보자면, 
    `Grade grade1 = Grade.BASIC;` 을 선언하면 `grade1`은 열거 상수인 `Grade.BASIC`가 가리키는, 
    `Grade가 저장된 stack의 번지`를 가리킵니다. 이에 따라 `grade1`과 `Grade.BASIC`은 같은 번지를 가리키는, 동일한 변수가 됩니다. 이로 인해 enum type은 `==`연산을 사용할 수 있습니다.
    
### Interface
- 이전에 수강한 [스프링 입문 강의](https://www.inflearn.com/course/%EC%8A%A4%ED%94%84%EB%A7%81-%EC%9E%85%EB%AC%B8-%EC%8A%A4%ED%94%84%EB%A7%81%EB%B6%80%ED%8A%B8) 에서는 확실히 이해할 수 없었던 Interface와 구현체의 관계를 이해했습니다.
    - 용어로 많이 사용되는 '바라보다'를 이해하게 되었습니다.
    - `MemoryMemberRepository`는 `MemoryRepository` 인터페이스를 구현합니다.
    - `MemberServiceImpl`은 `MemberService` 인터페이스를 구현합니다.
    - 이때, `MemberServiceImple`은 `MemberRepository` 인터페이스를 바라보지만(=참조하지만), 
    null pointer exception으로 인해 `MemoryMemberRepository` 구현체를 받아와 사용하고 있습니다.
    - 이러한 점에서 현재 작성된 코드는 **SOLID 객제지향 5원칙**의 DIP(의존관계 역전 원칙)을 
    위배하고 있습니다.
        - DIP 의존관계 역전 원칙이란, **구체화(구현 클래스)에 의존하는 대신 추상화(Interface)에 의존해야 한다**는 의존성 주입 원칙을 의미합니다.
    
### junit
- main()에서의 테스트 대신 junit을 사용하는 테스트를 이해하고, 구현할 수 있게 되었습니다.
