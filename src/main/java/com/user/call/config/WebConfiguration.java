package com.user.call.config;

import javax.annotation.Resource;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.config.annotation.*;

@Configuration
public class WebConfiguration
  /*implements WebMvcConfigurer*/
  extends WebMvcConfigurerAdapter
{
  @Resource
  private BasePathInterceptor basePathInterceptor;
  
  public void addInterceptors(InterceptorRegistry registry)
  {
    InterceptorRegistration addInterceptor = registry.addInterceptor(this.basePathInterceptor);
    
    addInterceptor.addPathPatterns(new String[] { "/**" });
  }
  
  @Bean
  public FilterRegistrationBean someFilterRegistration()
  {
    FilterRegistrationBean registration = new FilterRegistrationBean();
    CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter("utf8");
    registration.setFilter(characterEncodingFilter);
    registration.addUrlPatterns(new String[] { "/*" });
    registration.setName("characterEncodingFilter");
    return registration;
  }
  
  public void addResourceHandlers(ResourceHandlerRegistry registry)
  {
    registry.addResourceHandler(new String[] { "/static/**" }).addResourceLocations(new String[] { "classpath:/static/" });
  }
}
