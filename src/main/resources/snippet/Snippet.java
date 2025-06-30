package snippet;

public class Snippet {
	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE configuration
	  PUBLIC "-//mybatis.org//DTD Config 3.0//EN"
	  "http://mybatis.org/dtd/mybatis-3-config.dtd">
	
	<configuration>
	  <settings>
	    <!-- 스네이크 케이스 → 카멜케이스 자동 매핑 -->
	    <setting name="mapUnderscoreToCamelCase" value="true"/>
	  </settings>
	</configuration>
}

