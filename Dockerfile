FROM amazon/aws-cli:2.7.35

# install git
RUN yum install -y git \
    && yum clean all \
    && rm -rf /var/cache/yum

# install ECS CLI
RUN curl -o /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest \
    && chmod +x /usr/local/bin/ecs-cli

# print version infos
RUN git version
RUN aws --version
RUN ecs-cli --version

# reset entrypoint
ENTRYPOINT []
