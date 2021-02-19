# Spring Core Basic

수강한 강의는 인프런의 [스프링 핵심 원리](https://www.inflearn.com/course/%EC%8A%A4%ED%94%84%EB%A7%81-%ED%95%B5%EC%8B%AC-%EC%9B%90%EB%A6%AC-%EA%B8%B0%EB%B3%B8%ED%8E%B8/)입니다. 강의명을 누르면 이동합니다.

하단의 목차를 누르면 이동합니다.

# 목차
1. <a href="#1">객체지향 설계와 스프링</a>
2. <a href="#2">스프링 핵심 원리 이해1 - 예제 만들기</a>
3. <a href="#3">스프링 핵심 원리 이해2 - 객체 지향 원리 적용</a>
4. <a href="#4">스프링 컨테이너와 스프링 빈</a>
5. <a href="#5">싱글톤 컨테이너</a>
6. <a href="#6">컴포넌트 스캔</a>
7. <a href="#7">의존관계 자동 주입</a>
8. <a href="#8">빈 생명주기 콜백</a>
9. <a href="#9">프로토타입 스코프 - 싱글톤 빈과 함께 사용시 문제점</a>

<a name="1"></a>
# Section 1. 객체지향 설계와 스프링
- [레파지토리 링크](https://github.com/JooMal/withBackendRoadmap/tree/main/Spring/Section02/src)

좋은 객체 지향 설계의 5가지 원칙(SOLID)와, 해당 원칙을 지키기 위하여 어떤 의미에서 스프링을 사용하는지에 대해 배웠습니다.
1. SRP : 단일책임원칙. 한 클래스는 하나의 책임만 가진다.
2. OCP : 개방폐쇄원칙. 확장에는 열려있으나 변경에는 닫혀있어야한다.
3. LSP : 리스코프 치환 원칙
4. ISP : 인터페이스 분리 원칙
5. DIP : 의존관계 역전 원칙. 추상화에 의존해야지, 구체화에 의존하면 안된다.
단순 자바 프로그래밍과 JSP로는 지키기 어려웠던 OCP, DIP 원칙을 스프링을 도입하면서 지킬 수 있게 된다. 어떻게? 스프링 컨테이너에서 제공해주는 IoC(제어의 역전) 컨테이너 등을 통해서, 컨테이너가 직접 관리하는 빈(Bean)을 받아다가 사용하고, 추상화(인터페이스)만을 사용하여 구체화된 클래스를 받아올 수 있게 됐기 때문이다.

<a name="2"></a>
# Section 2. 스프링 핵심 원리 이해1 - 예제 만들기
- [레파지토리 링크](https://github.com/JooMal/withBackendRoadmap/tree/main/Spring/Section03)

### static import

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

<a name="3"></a>
# Section 3 : 스프링 핵심 원리 이해2 - 객체 지향 원리 적용
- 실습 위주의 강의였어서 필기가 없었습니다.

<a name="4"></a>
# Seciont 4 : 스프링 컨테이너와 스프링 빈
- [레파지토리 링크](https://github.com/JooMal/withBackendRoadmap/tree/main/Spring/Section04)

### Configuration, Bean

`@Configuration`, `@Bean` 어노테이션을 사용하여 기존의 자바 코드들에 스프링을 붙이기 시작했습니다. `AnnotationconfigApplicationContext` 클래스에 `AppConfig.class`를 파라미터로 넘겨주며 스프링 컨테이너를 생성하는 것을 시작으로, 기존의 코드를 스프링으로 바꾸어주었습니다.  

### 스프링 빈의 의존관계?
스프링 빈의 의존관계는 생성자를 호출하면서 함께 주입도 이루어지고 있습니다. 말이 **주입**이어서 어렵다뿐이지, 부모-자식의 관계라고 해야 할까요? 일종의 참조 관계, 위계 관계? 인터페이스와 구현체의 관계가 어떻게 이루어지고 있는 지에 대한 구체적인 정보를 넘겨주고 있는 듯 합니다. 이러한 구체적인 정보를 다시 말해 **참조를 넘겨준다**고 표현하고 있고요. 구현체A는 interfaceA를 참조하고 있고(==바라보고 있고==의존하고 있고), AppConfig 클래스에서 구체적인 구현 객체를 `new`로 만들어서 그 **참좃값을 넘겨주고** 있기 때문에, **참조를 넘겨준다**고 표현하는 듯 합니다.  

### 빈의 등록과 조회
이렇게 빈을 만들어보고, 빈들을 조회해보았습니다. 내가 **등록한** 빈이 무엇이 있는지 출력해볼 수 있었고(`getRole()`, `ROLE_APPLICATION`), `getBean()` 메소드를 이용해 빈을 조회해볼 수 있었습니다. 특히 `getBean()`은 `getBean(name)`, `getBean(type)`, `getBean(name, type)`으로 세 가지 매개변수가 있는데, name만을 이용해서 조회하려면 빈의 이름을 알아야 한다는 단점이 있습니다. 그렇다고 type(=빈이 상속받은 인터페이스!)만을 이용해서 조회하려면, 같은 타입의 빈이 여러 개일 경우에는 중복 오류가 발생합니다. 이 경우에는 이름도 함께 넣어서 조회해주어야 합니다.  

### 스프링 컨테이너 최상위 클래스 BeanFactory
빈을 관리하고 조회하는 인터페이스는 스프링 컨테이너의 최상위 클래스인 **BeanFactory**입니다. 해당 인터페이스로부터 `getBean()`을 상속받아 사용할 수 있구요. `AnnotationConfigApplicationContext`의 상위 인터페이스는 `ApplicationContext`가 있습니다. BeanFactory가 빈 조회와 관리를 제공해주긴 하지만, 그 외의 부가적인 기능은 ApplicationContext가 담당하고 있습니다. 메세지소스를 활용한 국제화 기능, 환경변수 설정 등을 해당 인터페이스에서 제공합니다. 이때, 환경변수 설정이란 로컬개발환경, 테스트서버환경(=개발환경), 운영환경, 추가로 staging환경(운영환경과 비슷하게 만들어둔 개발환경) 등을 설정하는 것을 의미하는데, 가령 환경마다 사용하는 DB가 다르고 사용하는 무언가의 버전이 다르고 등등을 설정해줍니다.  

### AppConfig XML
추가적으로 AppConfig 클래스를 xml파일로도 만들어보았습니다. 만드는 법까지는 외울(?) 필요가 없지만, 레거시 프로젝트 등에서는 쓰이고 있을 수 있으니 읽는 법은 알아야겠습니다.

### BeanDefinition
BeanDefinition 이라는 추상화로 스프링은 xml, class 등 다양한 설정 형식을 지원합니다. 어떤 설정 파일을 만들건간에, BeanDefinition 인터페이스를 받아 만들어지고 있는 듯 합니다.

<a name="5"></a>
# Section 5 : 싱글톤 컨테이너
- [레파지토리 링크](https://github.com/JooMal/withBackendRoadmap/tree/main/Spring/Section05)

<a name="6"></a>
# Section 6 : 컴포넌트 스캔
- [레파지토리 링크](https://github.com/JooMal/withBackendRoadmap/tree/main/Spring/Section06)

### 컴포넌트 스캔과 의동관계 자동 주입
- AppConfig와 같은 설정 정보가 없어도 스프링 프레임워크에서 자동으로 스프링 빈을 등록해줍니다. 이러한 기술을 `컴포넌트 스캔`이라고 합니다.
- 이에 따라 AppConfig 대신 새로운 설정 파일을 만들어주고,
    - 설정 클래스임을 나타내는 `@Configuration` 어노테이션과
    - `@ComponentScan` 어노테테이션을 붙여준 후,
- 각 구현체의 스프링 빈에 `@Component` 어노테이션을 붙여주면 됩니다.
- 로그에서 확인할 수 있듯, 스프링 빈들은 자동으로 **싱글톤**으로 생성됩니다. 코드 내에서는 `new`를 사용하더라도 스프링이 알아서 **싱글톤 객체**를 가져옵니다.

- 이렇게 만들고 나면, 이전까지의 **의존 관계**는 어떻게 명시해주는지 의아해집니다.
- 이를 위해 `@Autowired`라는 어노테이션이 존재합니다. **의존 관계 주입**을 위해 구현체의 생성자 함수에 `@Autowired`를 사용해주면, 스프링 컨테이너는 해당 구현체가 의존하는 인터페이스의 타입을 타고 올라가, 해당 인터페이스의 구현체의 생성자를 가져오게 됩니다.

```java
@Configuration
@ComponentScan
public class AutoAppConfig {}
```

- 해당 구조를 이해하기 위해 간략하게 현재 Bean들의 구조와 어노테이션들의 동작을 정리해보았습니다.

<img src="./img/currentStructure.jpg"></img>

- 빈 등록을 할 때 이름이 중복되지 않도록 주의해야 합니다. 컴포넌트 스캔에 의해 자동으로 스프링 빈이 등록이 되었을 때, 빈의 이름이 같은 경우에는 `ConflictBeanDefinitionException` 예외가 발생합니다. 수동으로 등록한 빈과 자동으로 등록된 빈이 충돌할 경우에는, 수동등록 빈이 자동등록 빈을 **오버라이딩**해버려서 자동등록 빈이 사라집니다. 애매한 버그로 큰 장애를 만들 수 있기 때문에 지양해야 합니다. => 최근 스프링부트에선 수동 빈 등록과 자동 빈 등록이 충돌시 오류가 발생하도록 기본값 수정

- `@ComponentScan`에선 컴포넌트들을 탐색할 시작 위치를 지정해줄 수도 있습니다. 기본값은 `@ComponentScan`이 붙은 **설정 정보 클래스의 패키지**가 시작 위치가 됩니다.
- 직접 지정해주는 방법은 다음과 같습니다.

```java
@ComponentScan (
    basePackages = "hello.core"
)
```

### 컴포넌트 스캔의 대상
- `@Component`
- `@Controller` : 스프링 MVC 컨트롤러라고 알려줍니다.
- `@Service` : 별 기능은 없고, 개발자들이 여기에 주요 비즈니스 로직이 있다는걸 알 수 있게 해줍니다.
- `@Repository` : 스프링 데이터 접근 계층으로 인식한다고 합니다. (JPA를 잘 몰라서 해당 부분은 정확히 이해하지 못했습니다.)
- `@Configuration` : 스프링 설정 정보.

### 필터 : 컴포넌트 스캔에 추가하기, 빼기
- Filters라는 것을 이용하여 컴포넌트 스캔에 특정 빈을 추가로 지정하거나 제외할 수 있습니다.
- includeFilters는 거의 쓰지 않고, 종종 excludeFilters를 쓴다고 하네요.

<a name="7"></a>
# Section 7 : 의존관계 자동 주입
- 실습 위주의 강의였어서 필기가 없었습니다.

<a name="8"></a>
# Section 8 : 빈 생명주기 콜백
- [레파지토리 링크](https://github.com/JooMal/withBackendRoadmap/tree/main/Spring/Section08)

### 컴포넌트 스캔과 의동관계 자동 주입
- AppConfig와 같은 설정 정보가 없어도 스프링 프레임워크에서 자동으로 스프링 빈을 등록해줍니다. 이러한 기술을 `컴포넌트 스캔`이라고 합니다.
- 이에 따라 AppConfig 대신 새로운 설정 파일을 만들어주고,
    - 설정 클래스임을 나타내는 `@Configuration` 어노테이션과
    - `@ComponentScan` 어노테테이션을 붙여준 후,
- 각 구현체의 스프링 빈에 `@Component` 어노테이션을 붙여주면 됩니다.
- 로그에서 확인할 수 있듯, 스프링 빈들은 자동으로 **싱글톤**으로 생성됩니다. 코드 내에서는 `new`를 사용하더라도 스프링이 알아서 **싱글톤 객체**를 가져옵니다.

- 이렇게 만들고 나면, 이전까지의 **의존 관계**는 어떻게 명시해주는지 의아해집니다.
- 이를 위해 `@Autowired`라는 어노테이션이 존재합니다. **의존 관계 주입**을 위해 구현체의 생성자 함수에 `@Autowired`를 사용해주면, 스프링 컨테이너는 해당 구현체가 의존하는 인터페이스의 타입을 타고 올라가, 해당 인터페이스의 구현체의 생성자를 가져오게 됩니다.

```java
@Configuration
@ComponentScan
public class AutoAppConfig {}
```

- 해당 구조를 이해하기 위해 간략하게 현재 Bean들의 구조와 어노테이션들의 동작을 정리해보았습니다.

<img src="./img/currentStructure.jpg"></img>

- 빈 등록을 할 때 이름이 중복되지 않도록 주의해야 합니다. 컴포넌트 스캔에 의해 자동으로 스프링 빈이 등록이 되었을 때, 빈의 이름이 같은 경우에는 `ConflictBeanDefinitionException` 예외가 발생합니다. 수동으로 등록한 빈과 자동으로 등록된 빈이 충돌할 경우에는, 수동등록 빈이 자동등록 빈을 **오버라이딩**해버려서 자동등록 빈이 사라집니다. 애매한 버그로 큰 장애를 만들 수 있기 때문에 지양해야 합니다. => 최근 스프링부트에선 수동 빈 등록과 자동 빈 등록이 충돌시 오류가 발생하도록 기본값 수정

- `@ComponentScan`에선 컴포넌트들을 탐색할 시작 위치를 지정해줄 수도 있습니다. 기본값은 `@ComponentScan`이 붙은 **설정 정보 클래스의 패키지**가 시작 위치가 됩니다.
- 직접 지정해주는 방법은 다음과 같습니다.

```java
@ComponentScan (
    basePackages = "hello.core"
)
```

### 컴포넌트 스캔의 대상
- `@Component`
- `@Controller` : 스프링 MVC 컨트롤러라고 알려줍니다.
- `@Service` : 별 기능은 없고, 개발자들이 여기에 주요 비즈니스 로직이 있다는걸 알 수 있게 해줍니다.
- `@Repository` : 스프링 데이터 접근 계층으로 인식한다고 합니다. (JPA를 잘 몰라서 해당 부분은 정확히 이해하지 못했습니다.)
- `@Configuration` : 스프링 설정 정보.

### 필터 : 컴포넌트 스캔에 추가하기, 빼기
- Filters라는 것을 이용하여 컴포넌트 스캔에 특정 빈을 추가로 지정하거나 제외할 수 있습니다.
- includeFilters는 거의 쓰지 않고, 종종 excludeFilters를 쓴다고 하네요.

<a name="9"></a>
# Section 9 : 프로토타입 스코프 - 싱글톤 빈과 함께 사용시 문제점
- [레파지토리 링크](https://github.com/JooMal/withBackendRoadmap/tree/main/Spring/Section09)

### 싱글톤
스프링의 기본 스코프이다.  보통은 이걸 쓴다.  
항상 같은 인스턴스의 스프링 빈을 반환함을 보장한다.  즉 싱글톤 빈을 스프링에서 관리해주다가, 요청할 때 해당 스프링 빈을 지원해주어 각 클라이언트는 사실상 같은 빈을 공유하여 사용하게 된다.  

### 프로토타입 스코프
빈의 생성과 의존관계 주입까지만 관리하고 이후에는 관리하지 않는다. 그래서 소멸자가 자동으로 불러지지 않는다. 보통은 안쓰지만, 굉장히 특수한 경우에서 사용한다.   
항상 새로운 인스턴스를 생성해서 반환한다. 요청하면 그 때 생성하고, **필요하면 의존관계 주입과 초기화까지 해서 클라이언트에게 던져주고 더이상 관리하지 않는다.**    
- 테스트를 해보면 predestroy 어노테이션을 붙여주더라도 정말 destroy가 실행되지 않는다. 직접 destroy해주어야 한다.

### 싱글톤 빈과 프로토타입 빈을 함께 사용하면 문제가 발생
둘을 자동 주입해주게 되면, 싱글톤 빈이 프로토타입 빈을 들고다녀서 새로 객체가 생성되지 않는다. 생성 시점에 주입받긴 하지만, 함께 생성되고 들려다니기 때문에 의도와 달리 계속 동일한 객체가 된다. 의도하는 바대로 코드 내에서 사용하기 위해선, application context를 매번 주입 받아야 한다.   

### 어떻게 같이 사용할까?
- DL(Dependency Lookup) : 스프링 컨테이너에서 빈을 찾아준다.
- ObjectProvider, ObjectFactory(옛날버전) : 테스트를 돌려보면 프로토타입 빈이 매번 생성된다. 항상 새로운 프로토타입 빈을 찾아주면서 생성해주고 있기 때문이다.
- 스프링 의존성이 너무 높다.

### JSR-330 Provider
- 자바 표준으로, `javax.inject:javax.inject:1` 라이브러리를 gradle에 추가하여 사용한다.
- 직전에 사용한 ObjectProvider를 그대로 대체해서 사용할 수 있고, 스프링이 아닌 다른 컨테이너에서도 사용할 수 있다.

### 웹 관련 스코프
1. request : 고객 요청이 나갈 때 소멸된다. **각 HTTP 요청마다** 별도의 빈 인스턴스가 생성되고, 관리된다.
2. session : 세션 생성부터 소멸까지, HTTP Session과 동일한 생명주기를 가지는 스코프
3. application : 서블릿 컨텍스와 같은 범위로 유지된다.
4. websocket : 웹 소켓과 동일한 생명주기를 가지는 스코프

사용하기 위해서는 gradle에 spring-boot-starter-web 의존성을 추가해주어야 한다.  

### request 실습에서 한 일
- 동시에 여러 http 요청이 왔을 때, 어떤 요청이 남긴 로그인지 구분하기 위한 Logger를 개발한다.
1. MyLogger : 로그를 출력해준다. request scope를 갖고, uuid와 requestURL과 message를 찍어주는 log 메서드를 가진다.
2. LogDemoController : 로거가 잘 작동하는지 확인하는 테스트용 컨트롤러. HttpServletRequest를 통해서  `http://localhost:8080/log-demo`  이라는 requestURL을 받으면, 이 URL을 저장해두고 controller test라는 메세지를 log에 넘겨준다.
3. LogDemoService : 비즈니스 로직이 있는 서비스 계층에서 로그를 출력해보기 위한다. 단, 서비스 계층은 웹 기술에 종속되지 않도록 순수한 자바 코드로 작성하는 것이 좋다.

### Provider까지 줄이기 : 스코프와 프록시
가짜 프록시 객체를 생성해서 MyLogger 대신에 등록되어 작동한다. 의존관계 주입도 이 가짜 프록시 객체가 주입되고, 프록시 객체가 myLogger를 호출하게 된다. 이를 통해 request scope를 마치 싱글톤 빈을 사용하듯이 쓸 수 있다. (하지만 싱글톤은 아니고, 매 요청마다 새로 생기기 때문에 주의해서 사용해야 한다.)  
왜 이렇게 하는걸까? 진짜 요청이 들어올 때까지 진짜 객체 조회를 지연하는 것이다.
