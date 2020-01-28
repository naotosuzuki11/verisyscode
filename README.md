##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.6.3]
- Rails [5.2.4]


# Project

[VandelayIndustries](https://verisyscode.herokuapp.com/)
[Upload page](https://verisyscode.herokuapp.com/upload)
[View page](https://verisyscode.herokuapp.com/review)



## Install

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

