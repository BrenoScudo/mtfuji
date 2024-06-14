package org.generation.italy.mtfuji;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MtfujiApplication {

	public static void main(String[] args) {
		SpringApplication.run(MtfujiApplication.class, args);
	}

//	@Configuration
//	public static class WebConfig implements WebMvcConfigurer{
//		@Override
//		public void addCorsMappings(CorsRegistry registry) {
//			registry.addMapping("/**").allowedOrigins("*").allowedMethods("*").allowedHeaders("*");
//		}
//	}

//	@Bean
//	public WebMvcConfigurer corsConfigurer(){
//		return new WebMvcConfigurer() {
//			@Override
//			public void addCorsMappings(CorsRegistry registry){
//				registry.addMapping("/**").allowedOrigins("*").allowedMethods("*").allowedHeaders("*");
//			}
//		};
//	}

}
