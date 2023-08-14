#!/bin/bash

# Colors
RD='\033[0;31m'
GR='\033[0;32m'
YL='\033[0;33m'
BL='\033[0;34m'
NC='\033[0m'

if [ -z "$INPUT_PHP_IMAGE" ]; then
  echo "::error::No PHP image provided"
  exit 1
fi

APP_DIR=""
# Check if symfony.lock file exists
if [ -f "symfony.lock" ]; then
  echo -e "${BL}Info:${NC} Symfony framework detected. Setting APP_DIR to 'src'${NC}"
  APP_DIR="src"
else
  echo -e "${BL}Info:${NC} Defaulting to Laravel framework. Setting APP_DIR to 'app'${NC}"
  APP_DIR="app"
fi

CMD="./vendor/bin/phpcs --standard=PSR2 --report=checkstyle --report-file=${INPUT_PHPCS_REPORT_PATH} ${APP_DIR}/ || true"

echo -e "${BL}Info:${NC} Running PHP Checkstyle with image: ${GR}$INPUT_PHP_IMAGE${NC}"
echo -e "${BL}Info:${NC} Checkstyle report path: ${GR}$INPUT_PHPCS_REPORT_PATH${NC}"
echo -e "${BL}Info:${NC} Running command: ${GR}${CMD}${NC}"
docker run \
  --platform linux/amd64 \
  -v "$PWD":/var/www \
  "$INPUT_PHP_IMAGE" \
  "/bin/bash" "-c" "${CMD}"
