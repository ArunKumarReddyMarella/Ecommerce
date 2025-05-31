package com.ecommerce.service;

import com.ecommerce.entities.Country;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public interface CountryService {
    Page<Country> getCountries(Pageable pageable);
    Country getCountryById(String id);
    Country createCountry(Country country);
    Country updateCountry(Country country);
    void patchCountry(String id, Map<String, Object> updates);
    void deleteCountry(String id);
}

