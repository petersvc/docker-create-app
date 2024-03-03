#!/bin/bash
echo "Loading the env variables"

if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

echo "Installing the Angular cli"

apt update -y && apt upgrade -y
npm i -g @angular/cli
export NG_CLI_ANALYTICS="false"

echo "Creating the Angular App $APP_NAME"

ng new $APP_NAME --routing --style scss --ssr false --skip-tests --skip-git
cd $APP_NAME
ng add @angular-eslint/schematics --defaults --skip-confirmation
npm i prettier -D --save-exact
npm i eslint-plugin-prettier -D

echo "{
  \"tabWidth\": 2,
  \"useTabs\": false,
  \"singleQuote\": true,
  \"semi\": false,
  \"bracketSpacing\": true,
  \"arrowParens\": \"avoid\",
  \"trailingComma\": \"none\",
  \"bracketSameLine\": true,
  \"printWidth\": 100
}" > .prettierrc.json
sed -i '/"plugin:@angular-eslint\/template\/process-inline-templates"/ s/$/,/; /"plugin:@angular-eslint\/template\/process-inline-templates"/a \ \ \ \ \ \ \ \ "plugin:prettier\/recommended"' .eslintrc.json

cd ..
chmod -R a+x $APP_NAME
chown -R 1000:1000 $APP_NAME
