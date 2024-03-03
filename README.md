# docker-create-app

Create and run a nextjs or angular app entirely through Docker, with no JS runtime installed on your machine.

### Installation & Usage

1. Install the **make** util.
   - On Ubuntu: sudo apt install make.
2. Run the following command on the linux terminal:
   - **make create app:=YourAppName** framework:=angular.

**That's it.**

### NextJS

**The nextjs app comes with**:
* Typescript.
* Tailwind.
* Eslint.
  - The set of rules comes from the @rocketseat/eslint-config package, made by the Brazilian developers from the Rockeseat educational plataform.
  - You can see the rules in this [link](https://github.com/Rocketseat/eslint-config-rocketseat/blob/main/next.js).
* Prettier.
* "app" folder, no src.

### Angular

* routing
* scss
* Eslint
* Prettier
