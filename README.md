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

1. Create a .env with two variables: PROJECT_NAME, DOCKER_IMAGE.
   - PROJECT_NAME=YourProjectName.
   - DOCKER_IMAGE=node:21.6.2-slim.
2. In the docker-compose.yml file, make sure that the **service name** is equal the PROJECT_NAME.
3. Install the **make** util.
   - On Ubuntu: sudo apt install make.
4. Run the following command on the linux terminal: **make create**.

**That's it.**
