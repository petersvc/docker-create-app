#!/bin/bash
echo "Creating a Nextjs App"

# Carregar as variáveis de ambiente do arquivo .env
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

npm i -g bun
bun create next-app $APP_NAME --ts --tailwind --eslint --app --no-src-dir --import-alias @
cd $APP_NAME
bun add eslint @rocketseat/eslint-config -d
bun add prettier-plugin-tailwindcss -d
rm .eslintrc.json
echo '{"extends": ["@rocketseat/eslint-config/next", "next/core-web-vitals"]}' > .eslintrc.json
echo '{"plugins": ["prettier-plugin-tailwindcss"]}' > .prettierrc.json
chmod -R o+rwx .
chown -R 1000:1000 .
