# gha-php-checkstyle

## Description
Run PHP checkstyle with custom PHP image.

## Inputs
| Key                  | Required  | Default              | Description                                                                                   |
|----------------------|-----------|----------------------|-----------------------------------------------------------------------------------------------|
| **php-image**        | **true**  | `N/A`                | PHP image to use (fully qualified image address. ex: quay.io/adoreme/nginx-fpm-alpine:v0.0.1) |
| **report-dir**       | **true**  | `build/reports`      | Report file directory (no trailing `/`).                                                      |
| **report-file-name** | **true**  | `php-checkstyle.xml` | Report file name.                                                                             |
| **phpcs-standard**   | **false** | `PSR2`               | PHP checkstyle standard to use.                                                               |
| **app-dir**          | **false** | ``                   | Source directory (no trailing `/`). When empty will try to guess if is `src` or `app`.        |

## Outputs
**N/A**

## Notes
ℹ This action doesn't handle docker registry authentication (e.g. for private images).
You can run [docker/login-action@v1](https://github.com/docker/login-action) before this step.

ℹ It uses [checkstyle-github-action](https://github.com/adore-me/checkstyle-github-action) for publishing checkstyle results.

### Example of step configuration and usage:

```yaml
steps:
  - name: 'Run PHP Checkstyle'
    uses: adore-me/gha-php-checkstyle@master
```
