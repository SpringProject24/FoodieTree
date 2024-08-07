package org.nmfw.foodietree.domain.store.dto.request;

import lombok.*;
import org.nmfw.foodietree.domain.store.entity.Store;
import org.nmfw.foodietree.domain.store.entity.value.StoreApproveStatus;
import org.nmfw.foodietree.domain.store.entity.value.StoreCategory;

import javax.validation.constraints.NotBlank;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class StoreSignUpDetailDto {

    @NotBlank
    private String storeId;

    @NotBlank
    private String password;

    @Setter
    @NotBlank
    private StoreCategory category;

    @Setter
    @NotBlank
    private String address;

    @Setter
    @NotBlank
    private StoreApproveStatus approve;

    @Setter
    @NotBlank
    private int warningCount;

    @Setter
    @NotBlank
    private int price;

    @Setter
    @NotBlank
    private String businessNumber;

    // 가게 프로필 이미지 주소 변수 추가
    // 가게에서 가게 대표이미지 설정 안해둘 수 있으므로 null 체크 안함
    @Setter
    private String storeImage;

    public Store toEntity(){
        return Store.builder()
                .password(this.password)
                .category(this.category.getFoodType())
                .address(this.address)
                .approve(this.approve)
                .warningCount(this.warningCount)
                .price(this.price)
                .businessNumber(this.businessNumber)
                .storeImage(this.storeImage)
                .build();
    }
}
