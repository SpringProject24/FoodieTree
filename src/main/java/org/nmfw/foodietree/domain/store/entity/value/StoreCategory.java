package org.nmfw.foodietree.domain.store.entity.value;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
@AllArgsConstructor
public enum StoreCategory {
    //    한식, 양식, 카페, 일식, 디저트, 중식, 기타
    KOREAN("한식"),
    WESTERN("양식"),
    CAFE("카페"),
    JAPANESE("일식"),
    DESSERT("디저트"),
    CHINESE("중식"),
    ELSE("기타");

    private final String foodType;
}
