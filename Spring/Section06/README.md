## Section 6 : 컴포넌트 스캔

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

<img src="/img/currentStructure.jpg"></img>

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