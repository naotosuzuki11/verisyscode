To the Verisys team, 

My apologizies for not using the latest version of Rails or Ruby. My personal macbook's monitor is being fixed so I borrowed a friend's computer to complete this assessment. I did deploy the application to make testing the site as easy as possible for your team. https://verisyscode.herokuapp.com/. By the time I noticed that it wasn't up to date I was nearly done. I wish I could have used .upsert though!

The [View page](https://verisyscode.herokuapp.com/review) should be empty the first time the site is accessed. I have tested the application using the templates sent to me. 

You can clone the repo here.
```shell
https://github.com/naotosuzuki11/verisyscode.git
cd project
```

Thanks for the opportunity to build this! I almost wished I had more time to complete this as if it was a real project for work.








##### Instructions to run locally below:

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.3]
- Rails [5.2.4]


# Project

[VandelayIndustries](https://verisyscode.herokuapp.com/)
[Upload page](https://verisyscode.herokuapp.com/upload)
[View page](https://verisyscode.herokuapp.com/review)


### Clone the repository

```shell
https://github.com/naotosuzuki11/verisyscode.git
cd project
```

### Check your Ruby version

```shell
ruby -v
```

```shell
rbenv install 2.6.3
```

### Install dependencies


```shell
bundle install
yarn update
```

### Initialize the database

```shell
rails db:create db:migrate 
```


## Serve

```shell
rails s
```

