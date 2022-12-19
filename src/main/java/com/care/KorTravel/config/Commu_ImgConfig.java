package com.care.KorTravel.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
public class Commu_ImgConfig {
	
	@Bean
	MappingJackson2JsonView jsonView() {
		return new MappingJackson2JsonView();
	}

}
