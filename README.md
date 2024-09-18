# <center>BrainFood</center>

## Table of Contents
- [Summary](#summary)
  - [Game Overview](#game-overview)
  - [Project Background](#project-background)
  - [Project Links](#project-links)
- [Instructions](#instructions)
  - [Basic Setup](#basic-setup)
  - [External API Setup](#external-api-setup)
  - [Running a Local Server](#running-a-local-server)
  - [Testing](#testing)
- [Endpoints](#endpoints)
- [Contributors](#contributors)

## Summary
This API-only Rails app handles triva question creation for Brain Defrost. Questions are received from an external API, processed as plain old ruby objects (POROs), then sent to this [repository](https://github.com/Brain-Defrost/Brain-Defrost_BE) where they are associated with a game. The trivia topic and question count are provided by this [repository](https://github.com/Brain-Defrost/Brain-Defrost_BE).

### Game Overview
Brain Defrost is a web application designed to help people become more connected and engaged virtually via a trivia game. Generative AI is used to create custom trivia questions based on the topic and desired question count provided.

To play, a user inputs a topic, number of questions, number of players, a time limit to answer questions, and what they'd like their display name to be. The user is then taken to the game's lobby and provided with a shareable link other players may use to join. Once everyone joins, players may start the game and enjoy answering trivia questions. The correct answer and a list of players who answered correctly is displayed after each question.

### Project Background

This project was completed for Turing's Capstone Project for Mod 4. [Part 1](https://mod4.turing.edu/projects/capstone/) of the project pertained planning and completing our app's minimum viable product (MVP). [Part 2](https://mod4.turing.edu/projects/capstone_expansion/) will focus on adding additional features.

### Project Links
|Repo|Deployment|Description|
|:--:|:--:|:--:|
|[FE Repo](https://github.com/Brain-Defrost/Brain-Defrost_FE)|[FE Github.io](https://brain-defrost.github.io/Brain-Defrost_FE/)| Play a game of trivia|
|[BE Repo 1](https://github.com/Brain-Defrost/Brain-Defrost_BE) | [BE Heroku](https://brain-defrost-f8afea5ead0a.herokuapp.com/)| Game, player, stats API|
|[BE Repo 2](https://github.com/Brain-Defrost/Brain-Defrost_BE-Questions) (you're here) |[BE Render](https://brain-defrost-be-questions.onrender.com/)|Questions API|


## Instructions
### Basic Setup
1. Fork and/or clone this repo from GitHub
2. In terminal, run `git clone <ssh or https path>`
3. Navigate into the cloned project by running `cd Brain-Defrost_BE-Questions`
4. Run `bundle install` to install gems used for this project
5. Setup the database by running rails db:{drop,create,migrate}

### External API Setup
Trivia question's are created using [OpenAI's API](https://platform.openai.com/docs/api-reference/introduction). You must use your own API key in order to access it. 

To acquire an Open AI API key:

1. Sign in or create an [OpenAI account](https://platform.openai.com/signup)
2. Go to your [API keys page](https://platform.openai.com/account/api-keys)
3. Open AI currently requires a verified phone number to create an API key.  click on "Start verification"
4. Click on "Create new secret key"
   - Note: Open AI currently requires a verified phone number to create an API key. If you don't have a verified number: 
     1. Click on "Start verification" at the top of the screen
     2. Verify a phone number
     3. Click on "Create new secret key"<br><br>

To add your OpenAI API key to the rails app:

1. If one already exists, delete the `config/master.key` file
2. In the terminal, run `EDITOR="code --wait" rails credentials:edit`
   - This creates a new `config/master.key` file and opens a credentials file (`config/credentials.yml.enc`)
3. Paste the code below in the credentials file that opens (can go above or below the secret key)
    ```yml
    open_ai_key: 
      Bearer <your_open_ai_api_key_here>
    ```
4. Close the credentials file and have fun coding


> [!important]
> Don't hard code your API key or share it with anyone. It's secret. The steps above help ensure it stays that way. Your master key is also secret as it's required to access the encrypted credentials file you setup. The master key's file is already configured to be excluded from GitHub via the `/config/master.key` code in the `.gitignore` file.
>
> You can think of Rails' credentials file as similar to a `.env` file.
> If you need to update the credentials file for any reason, simply use the `EDITOR="code --wait" rails credentials:edit` terminal command again.


### Running a Local Server
This app uses `http://localhost:5000`.

To start the local server run `rails server` in the terminal while in the app's base directory (Brain-Defrost_BE-Questions folder).

To stop the local rails server use `Ctrl` + `C` in the open terminal.

### Testing
[Rspec](https://rspec.info/documentation/) was used for testing. This project currently uses rspec-rails v6.1 and rspec-core v3.13.
The [vcr](https://github.com/vcr/vcr) and [webmock](https://github.com/bblimke/webmock) gems are setup to help limit tests' external API calls. 

**Terminal commands**<br>
<details>
<summary>To run the entire test suite</summary>

```shell
bundle exec rspec spec
```
</details>

<details>
<summary>To run a test folder</summary>

```shell
bundle exec rspec spec/folder_name
# ex: bundle exec rspec spec/models
```
</details>

<details>
<summary>To run just one file</summary>

```shell
bundle exec rspec <path/to/test/file>
# ex: bundle exec rspec spec/poros/question_spec.rb
```
</details>

<details>
<summary>To run just one test</summary>

```shell
bundle exec rspec <path/to/test/file>:test_line
# ex: bundle exec rspec spec/requests/api/v1/questions_spec.rb:20
```
</details>


## Endpoints
API documentation may be accessed [here](https://brain-defrost-be-questions.onrender.com/api-docs/index.html). Documentation was setup using the [rswag gem](https://github.com/rswag/rswag?tab=readme-ov-file) and [SwaggerUI](https://swagger.io/tools/swagger-ui/). 

To access the API documentation on the local server. [Start](#local-server) the server and navigate to `http://localhost:5000/api-docs/index.html` in a browser.

If preferred, you can also use [Postman](https://www.postman.com/) to run endpoints, but you will still need to startup the local server using the `rails server` command.

>[!caution]
> Every time you run the POST questions endpoint via SwaggerUI or Postman you are making an actual API call to OpenAI using your API key

## Contributors
#### Backend Team
Martin Chavez - [Github](https://github.com/laurarvegav) | [LinkedIn](https://www.linkedin.com/in/laurarvegav/)<br>
Jessica Kohl - [Github](https://github.com/kohljd) | [LinkedIn](https://www.linkedin.com/in/jessica-kohl-545785113/) <br>
Laura Vega - [Github](https://github.com/laurarvegav) | [LinkedIn](https://www.linkedin.com/in/laurarvegav/)

#### Frontend Team
Ethan Duvall - [Github](https://github.com/EthanDuvall) | [LinkedIn](https://www.linkedin.com/in/eaduvall/)<br>
Tayla Phillips - [Github](https://github.com/tednaphil) | [LinkedIn](https://www.linkedin.com/in/taylarichardsphillips/)
