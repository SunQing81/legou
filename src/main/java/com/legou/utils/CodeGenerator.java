package com.legou.utils;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

class CodeGenerator {
    public static void main(String[] args) throws Exception {
        List warnings = new ArrayList();
        boolean overwrite = true;
        File configFile = new File("generation.xml");
        ConfigurationParser parse = new ConfigurationParser(warnings);
        Configuration config = parse.parseConfiguration(configFile);
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config,
                callback, warnings);
        myBatisGenerator.generate(null);
    }
}
