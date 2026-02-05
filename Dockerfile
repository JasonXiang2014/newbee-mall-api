# 基础镜像：OpenJDK17轻量版（Alpine）
FROM openjdk:17-jdk-alpine
# 配置时区
ENV TZ=Asia/Shanghai
# 一次性安装依赖+配置时区，无冗余，构建层干净
RUN apk add --no-cache tzdata libc6-compat && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone
# 创建/app目录
RUN mkdir -p /app
# 复制有效JAR包到容器（包名和你目录下完全一致，无需改）
COPY newbee-mall-api-3.0.0-SNAPSHOT.jar /app/app.jar
# 暴露端口
EXPOSE 28019
# 启动JAR包（2核2G配置不变）
CMD ["java", "-Xms1024m", "-Xmx1024m", "-jar", "/app/app.jar"]