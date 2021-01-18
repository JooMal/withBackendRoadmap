# Basic Spring

[인프런 스프링 핵심 원리 기본편](https://www.inflearn.com/course/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%95%B5%EC%8B%AC-%EC%9B%90%EB%A6%AC-%EA%B8%B0%EB%B3%B8%ED%8E%B8)섹션 2 수강

# What I Learn

- static import

```java
import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;
```

`Alt` + `Enter` 단축키를 이용하여 정적 메소드(Static Method)로 import할 수 있다. static method란 인스턴스의 생성 없이 호출이 가능하며, 주로 유틸리티 관련 함수들을 static method로 사용합니다. 가령 java.util.Math를 이렇게 사용하면 되겠습니다.

- `@DisplayName`

각각의 테스트에 이름을 표기하기 위하여 사용합니다. 해당 기능이 사용이 되지 않을 경우엔, Build, Execution, Deployment > Build Tools > Gradle로 이동하여 Run tests using을 Gradle에서 intellij IDE로 수정해줍니다.

### DIP를 지키려니 NPE가 발생한다.

```java
    private final MemberRepository memberRepository = new MemoryMemberRepository();
    //private final DiscountPolicy discountPolicy = new FixDiscountPolicy();
    private final DiscountPolicy discountPolicy = new RateDiscountPolicy();

```

예제에서 discountPolicy를 FixDiscountPolicy에서 RateDiscountPolicy로 변경하려니, 클라이언트단 코드인 OrderServiceImpl을 바꾸어주어야 한다! 마치 DiscountPolicy라는 인터페이스에만 의존하는 듯 보였지만, 실제 코드에선 구현체인 FixDiscountPolicy와 RateDiscountPolicy 역시 의존하고 있는 것임.  
-> 구현체를 없애고 인터페이스만 남겨두면? 당연히 널포인트 익셉션이 발생한다. 이를 해결하려면 어디선가 대신 구현 객체를 생성하고 주입해주어야 하는데, 결국 이 역할을 하는게 스프링이다!  

### 생성자 주입
- 생성자 주입을 통해 DIP를 완전하게 지킬 수 있다.
- AppConfig 클래스를 만들어, 구현 클래스는 실제 동작에 필요한 어떤 구현체가 들어올지 모르더라도 인터페이스만 갖고 실행할 수 있다. AppConfig가 **구현 클래스에 생성자를 주입해주고 있다**.  
- 구현 클래스는 생성자를 통해 어떤 구현 객체가 들어올지 몰라도 된다. 구현체 대신, 인터페이스만을 의존한다.

### AppConfig 리팩토링
- 애플리케이션 전체 구성을 한 눈에 파악할 수 있게 되고, 불필요한 중복이 제거되었다. 해당 역할이 이러한 구현 클래스를 갖는다는 것을 바로 파악할 수 있다.

### Spring 적용

```java
00:00:49.228 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.annotation.internalConfigurationAnnotationProcessor'
00:00:49.488 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.event.internalEventListenerProcessor'
00:00:49.491 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.event.internalEventListenerFactory'
00:00:49.492 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.annotation.internalAutowiredAnnotationProcessor'
00:00:49.494 [main] DEBUG org.springframework.beans.factory.support.DefaultListableBeanFactory - Creating shared instance of singleton bean 'org.springframework.context.annotation.internalCommonAnnotationProcessor'
```

적용하면 위처럼 Bean이 등록된다는 문구가 뜬다! 이제부턴 개발자 대신 스프링컨테이너가 DI 의존관계를 책임지게 된다.  

오히려 코드만 더 복잡해진거 아닌가? 싶은데, 이 부분부터는 다음 시간에 다루신다고 한다. 궁금하다....  
