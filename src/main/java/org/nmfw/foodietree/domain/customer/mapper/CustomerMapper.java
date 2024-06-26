package org.nmfw.foodietree.domain.customer.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.nmfw.foodietree.domain.customer.entity.Customer;

import java.util.List;

@Mapper
public interface CustomerMapper {

    // 회원 가입
    boolean save(Customer customer);

    // 회원 정보 개별 조회
    Customer findOne(String customer);

    // 중복 확인 (아이디, 이메일)
    /**
     *
     * @param type - 어떤걸 중복검사할지 (ex: account OR email)
     * @param keyword - 중복검사할 실제값
     * @return - 중복이면 true, 아니면 false
     */
    boolean existsById(
            @Param("type") String type,
            @Param("keyword") String keyword
    );


    // N선호하는 음식 저장하기
    void savePreferredFoods(@Param("customerId") String customerId,
                            @Param("preferredFoods") List<String> preferredFoods);

}
