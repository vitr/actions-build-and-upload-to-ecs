# actions-build-and-upload-to-ecs

This action builds a Docker image and uploads it to the Amazon Elastic Container Registry (Amazon ECR) repository.

## Parameters
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `access_key_id` | `string` | | Your AWS access key id |
| `secret_access_key` | `string` | | Your AWS secret access key |
| `account_id` | `string` | | Your AWS Account ID |
| `repo` | `string` | | Name of your ECR repository |
| `region` | `string` | | Your AWS region |
| `create_repo` | `boolean` | `false` | Set this to true to create the repository if it does not already exist |
| `tags` | `string` | `latest` | Comma-separated string of ECR image tags (ex latest,1.0.0,) |
| `dockerfile` | `string` | `Dockerfile` | Name of Dockerfile to use |
| `extra_build_args` | `string` | `""` | Extra flags to pass to docker build (see docs.docker.com/engine/reference/commandline/build) |
| `path` | `string` | `.` | Path to Dockerfile, defaults to the working directory |

## Usage
```yaml
jobs:
  build-and-push:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: vitr/actions-build-and-upload-to-ecs@master
        with:
          access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          account_id: ${{ secrets.AWS_ACCOUNT_ID }}
          repo: aws-ecr-repo
          region: ap-northeast-2
          tags: latest,${{ github.sha }}
          create_repo: true
```

## Reference
* https://github.com/CircleCI-Public/aws-ecr-orb
* https://github.com/elgohr/Publish-Docker-Github-Action


