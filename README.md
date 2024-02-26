# docker-create-next-app

Create and run a nextjs app entirely through Docker, with no JS runtime installed on your machine.

This nextjs app comes with:
* Typescript
* Tailwind
* Eslint
  - The set of rules comes from the @rocketseat/eslint-config package, made by the Brazilian developers from the Rockeseat educational plataform.
  - You can see the rules in this [link](https://github.com/Rocketseat/eslint-config-rocketseat/blob/main/next.js)
* Prettier
* "app" folder, no src.

**Installation**

1. Install the **make** util.
   - On Ubuntu: sudo apt install make.
2. In the docker-compose.yml file, you will want to change the **service name** for another one.
3. Run the following command on the linux terminal:
   - **make create app:=YourAppName**.
   - Make sure that your **app** has the same name as the **service name**

**That's it.**
