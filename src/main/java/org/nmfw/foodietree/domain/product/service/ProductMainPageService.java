package org.nmfw.foodietree.domain.product.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.nmfw.foodietree.domain.customer.dto.resp.PreferredFoodDto;
import org.nmfw.foodietree.domain.customer.mapper.CustomerMyPageMapper;
import org.nmfw.foodietree.domain.product.dto.response.ProductDto;
import org.nmfw.foodietree.domain.product.dto.response.CategoryByFoodDto;
import org.nmfw.foodietree.domain.product.mapper.ProductMainPageMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductMainPageService {
    private final ProductMainPageMapper productMainPageMapper;
    private final CustomerMyPageMapper customerMyPageMapper;

    // product 메인페이지 상품정보 조회 중간 처리
    public List<ProductDto> getProductInfo() {
        return productMainPageMapper.findAll();
    }

    public List<CategoryByFoodDto> getCategoryByFood(String customerId) {
        List<PreferredFoodDto> preferenceFoods = customerMyPageMapper.findPreferenceFoods(customerId);
        preferenceFoods.forEach(e-> log.info("{}", e));
        if (preferenceFoods.isEmpty()) {
            log.info("null");
            return null;
        }
        return productMainPageMapper.categoryByFoodList(preferenceFoods);
    }

    public List<String> getCategoryByArea(String customerId) {
        List<String> preferenceAreas = customerMyPageMapper.findPreferenceAreas(customerId);
        if (preferenceAreas.isEmpty()) {
            return null;
        }
        return productMainPageMapper.categoryByAreaList(preferenceAreas);
    }

}
