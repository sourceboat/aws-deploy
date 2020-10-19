# sourceboat/aws-deploy

[![Docker Build Status](https://img.shields.io/docker/cloud/build/sourceboat/aws-deploy.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/aws-deploy/builds/)
[![Release](https://img.shields.io/github/release/sourceboat/aws-deploy.svg?style=flat-square)](https://github.com/sourceboat/aws-deploy/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/sourceboat/aws-deploy.svg?style=flat-square)](https://hub.docker.com/r/sourceboat/aws-deploy/)
[![MicroBadger Size](https://img.shields.io/microbadger/image-size/sourceboat/aws-deploy.svg?style=flat-square)](https://microbadger.com/images/sourceboat/aws-deploy)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/sourceboat/aws-deploy.svg?style=flat-square)](https://microbadger.com/images/sourceboat/aws-deploy)

This docker image contains deployment tools for AWS.

## What's included?

- [Git CLI](https://git-scm.com/) `git`
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html) `aws`
- [ECS CLI](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_CLI.html) `ecs-cli`

## Usage

### Simple ECS Deployment with ELB via GitLab CI

```yml
deploy:
    stage: deploy
    image: sourceboat/aws-deploy:latest
    variables:
        DEFAULT_LAUNCH_TYPE: FARGATE
        REGION: eu-central-1
        PROJECT_NAME: production
        CLUSTER: my-ecs-clustername
        TARGET_GROUP_ARN: arn:aws:...
        CONTAINER_NAME: app
        CONTAINER_PORT: 8080
        TIMEOUT: 20
    script:
        - ecs-cli configure --cluster $CLUSTER --default-launch-type $DEFAULT_LAUNCH_TYPE --region $REGION --config-name default-cluster
        - ecs-cli configure default --config-name default-cluster
        - ecs-cli compose --project-name $PROJECT_NAME service up --target-group-arn $TARGET_GROUP_ARN --container-name $CONTAINER_NAME --container-port $CONTAINER_PORT
```

Don't forget to provide `$AWS_ACCESS_KEY_ID` and `$AWS_SECRET_ACCESS_KEY` via GitLab CI/CD variable.

## Changelog

Check [releases](https://github.com/sourceboat/aws-deploy/releases) for all notable changes.

## Credits

- [Philipp Kübler](https://github.com/PKuebler)
- [All Contributors](https://github.com/sourceboat/aws-deploy/graphs/contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
