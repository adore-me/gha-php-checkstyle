# gha-php-checkstyle

## Description
Run checkstyle with custom PHP image.

## Inputs
| Key                   | Required | Default                                            | Description                                                |
|-----------------------|----------|----------------------------------------------------|------------------------------------------------------------|
| **php-image**         | **true** | `''`                                               | PHP image tag to use                                       |
| **report-path**       | **true** | `./build/reports/php-checkstyle.xml`               | Report file path (where checkstyle results will be saved). |

## Outputs
**N/A**

## Notes
ℹ This action doesn't handle docker registry authentication (e.g. for private images).
You can run [docker/login-action@v1](https://github.com/docker/login-action) before this step.

ℹ It uses [checkstyle-github-action](https://github.com/jwgmeligmeyling/checkstyle-github-action) for publishing checkstyle results.

### Example of step configuration and usage:

```yaml
steps:
  - name: 'Run Checkstyle'
    uses: adore-me/php-checkstyle-action@master
```
