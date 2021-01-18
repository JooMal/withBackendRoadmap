package hello.hellospring.repository;

import hello.hellospring.domain.Member;

import java.util.List;
import java.util.Optional;

public interface MemberRepository {

    Member save(Member member);
    Optional<Member> findById(Long id);
    Optional<Member> findByName(String name);
    List<Member> findAll(); //저장된 모든 멤버를 불러온다
}

// Optional은 Java8에 들어간 기능으로, findById로 가져왔는데 없으면 null이 돌아온다. 이를 그대로 반환하는게 아니라, Optional로 감싸서 반환하는 방법을 자주 이용함
