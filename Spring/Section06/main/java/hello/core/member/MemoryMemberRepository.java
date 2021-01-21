package hello.core.member;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class MemoryMemberRepository implements MemberRepository {

    // 실무에선 동시성 이슈를 위해 Concurrent HashMap을 사용해야 한다.
    private static Map<Long, Member> store = new HashMap<>();

    @Override
    public void save(Member member) {
        // put(key, value)
        store.put(member.getId(), member);
    }

    @Override
    public Member findById(Long memberId) {
        return store.get(memberId);
    }
}
