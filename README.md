# activiti-cloud-common-chart

A common base Helm chart for any Activiti Cloud service.

## How to Use

This chart is meant to be used as a dependency in a larger application chart, for example:

```yaml
- name: common
  repository: https://activiti.github.io/activiti-cloud-helm-charts
  version: $VERSION
  alias: my-service
  condition: application.my-service.enabled,my-service.enabled
```

A minimum amount of value overrides must be provided:

```yaml
my-service:
  enabled: true
  nameOverride: my-service
  service:
    name: my-service
  image:
    repository: activiti/my-service
    tag: latest
  ingress:
    enabled: true
    path: /my-service
```

More details on available properties and globals can be found in [README.md](./charts/common/README.md).

## CI/CD

Running on GH Actions.

For Dependabot PRs to be validated by CI, the label "CI" should be added to the PR.

Requires the following secrets to be set:

| Name                         | Description                        |
| ---------------------------- | ---------------------------------- |
| BOT_GITHUB_TOKEN             | Token to launch other builds on GH |
| BOT_GITHUB_USERNAME          | Username to issue propagation PRs  |
| SLACK_NOTIFICATION_BOT_TOKEN | Token to notify slack on failure   |

## Formatting

The local `.editorconfig` file is leveraged for automated formatting.

See documentation at [pre-commit](https://github.com/Alfresco/alfresco-build-tools/tree/master/docs#pre-commit).

To run all hooks locally:

```sh
pre-commit run -a
```
