To the Verisys team, 

My apologizies for not using the latest version of Rails or Ruby. My personal macbook's monitor is being fixed so I borrowed a friend's computer to complete this assessment. I did deploy the application to make testing the site as easy as possible for your team. https://verisyscode.herokuapp.com/. By the time I noticed that it wasn't up to date I was nearly done. I wish I could have used .upsert though!

The [View page](https://verisyscode.herokuapp.com/review) should be empty the first time the site is accessed. I have tested the application using the templates sent to me. 

You can clone the repo here.
```shell
https://github.com/naotosuzuki11/verisyscode.git
```

Thanks for the opportunity to build this! I almost wished I had more time to complete this as if it was a real project for work.


### Overview of the process you used and the technologies you used
  My goal was to write clean/simple code to complete each of the checkpoints asked for by the assessment. Most of the application is built using basic rails with limited gems. I'd love to have used more libraries and gems to make a robust web app. 
  
### Any challenges you faced
  Challenge #1. Looking at the prompt I initially only created one model to keep things simple, which was VandelayContact. However, I realized that the best way to combine records and append to the master record (latest update-date) would be to create a new Number and Address Model. I kept them separate because I thought it may be best for sustainability. Each Model belongs to an instance of VandelayContact. 
  
  Challenge #2. I usually really enjoy front end work and care about making sure pages are all responsive and follow good front end practices. I enjoy scalable UI with good components. However, after realizing I had already spent a good amount of time on the project I had to be scrappy and create a few front-end pages with terrible front-end code. Wasn't happy to do it but it does work, and I wanted to make sure your team could test the easily. 

### Questions or assumptions you made
  I had to make assumptions for this project to complete it in a timely manner. The app assumes that users know what it is for, and knows what template should be used to import. It also assumes that the exact same file won't be uploaded over and over. It does work and the final list tests for duplicates, but it can make unnecessary merged records. 

### Next steps to finish the challenge
  If I had all the time in the world there would be a lot of cool features I'd love to work on!
  
  ##### Maine step I'd do next: 
  - I would like to be more strategic and think through where all the functions should be. With the goal to make my code very easy for team members to look at and understand exactly why I did things and make the import faster. I'd also like to have included detailed comments. I don't think my vc controller is "too big" but it does hold most of my code. I started to move them to service objects but decided this works for a project of this scope and I wanted to save time. 
  
  ##### Other features I'd do next: 
  - not require a template and set the db up to read any fields. 
  - download a template copy on the upload page. 
  - redo the entire front end. Use next or react.
  - create logging in so multiple users can use the app and have security but also the ability to share. 
  - write tests 
  - complete "docker-izing" 
  
### Feedback on the challenge itself
  - I had fun using rails and ruby (my current role I use django and python) and remembered how valuable it is to use different technologies to learn best development practices. I was a little frustrated with the amount of time it took, but I am very excited at the prospect of Verisys. I know the assessment instructs spending 2-3 hours but I probably spent double that to refactor code and make sure I felt comfortable submitting this to be assessed. For a very basic web app I struggled finding balance in what I should do to make it work / what I can do. 


### JSON Output from the 3 samples that you ingest
  Link to access the validated / merged contacts below. 
  https://verisyscode.herokuapp.com/vandelay_contacts.json




## Instructions to run locally below:

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


### Serve

```shell
rails s
```

I would love any feedback! Thank you for your time.
