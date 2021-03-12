package com.immortal;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.immortal.dao")  //扫描mapper接口所在的包
public class CrmApplication {
    public static void main(String[] args) {
        SpringApplication.run(CrmApplication.class,args);
    }
}
