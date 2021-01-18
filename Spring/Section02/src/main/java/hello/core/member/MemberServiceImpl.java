package hello.core.member;

public class MemberServiceImpl implements MemberService {

    // 인터페이스 뿐이니까 앞에서 만든 구현 객체를 선택해주어야 한다.
    // => DIP를 위반하고 있다.
    private final MemberRepository memberRepository = new MemoryMemberRepository();

    // 다형성에 의해 override 된 아래의 메소드가 호출된다.
    @Override
    public void join(Member member) {
        memberRepository.save(member);
    }

    @Override
    public Member findMember(Long memberId) {
        return memberRepository.findById(memberId);
    }
}
