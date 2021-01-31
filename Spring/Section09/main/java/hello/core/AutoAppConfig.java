package hello.core;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.FilterType;

// @ComponentScan Annotation이 붙은건 싹 긁어온다
// excludeFilters => 이전에 등록해준 다른 설정정보는 제외시켜주려고 (충돌 날까봐)
// 기존 예제 코드를 남기기 위한거고, 실무에서는 이렇게 안씀
@Configuration
@ComponentScan (
        basePackages = "hello.core", // 이놈 이후의 컴포넌트들만 긁어온다
        // basePackageClasses = AutoAppConfig.class, => 이게 디폴트인듯 (그러니까 최상단에 메인 설정정보를 두자~)
        excludeFilters =  @ComponentScan.Filter(type = FilterType.ANNOTATION, classes = Configuration.class)
)
public class AutoAppConfig {
    // 여긴 텅 비었는데 그럼 의존관계 주입은 어떻게 하냐?
    // 자동 의존관계 주입 (@Autowired) 사용
}
