FROM amazon/aws-cli:2.0.8
# GIT
RUN yum install -y git \
    && yum clean all \
    && rm -rf /var/cache/yum
# ECS CLI
RUN curl -o /usr/local/bin/ecs-cli https://amazon-ecs-cli.s3.amazonaws.com/ecs-cli-linux-amd64-latest \
    && chmod +x /usr/local/bin/ecs-cli

RUN git version
RUN aws --version
RUN ecs-cli --version

# Reset entrypoint
ENTRYPOINT []
