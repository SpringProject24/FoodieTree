package org.nmfw.foodietree.domain.product.dto.response;

import lombok.*;

import java.time.LocalDateTime;

@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@NoArgsConstructor
@Builder

public class CategoryByFoodDto {
    private String storeId;
    private String productId;
    private LocalDateTime pickupTime;
    private LocalDateTime productUploadDate;
    private String storeImg;
    private String storeName;
    private String category;
    private int price;
}
