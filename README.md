# Devise Sandbox

Just setting this up quick for fun and to test a few options.<br>
Basic Ruby on Rails application with a User Model, Devise for user authentication and S3 bucket to store UserAvatar images.<br>
It uses Sendgrid to email on account verification and password resets.

In Production create an AWS S3 bucket, an IAM user and a policy for permissions and the connection.

Save what you need in the ENV
```
$ heroku config:set S3_BUCKET=xxxxxxxxxxxxxxx -a devise-sandbox
$ heroku config:set S3_ACCESS_KEY=xxxxxxxxxxxxxxx -a devise-sandbox
$ heroku config:set S3_SECRET_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx -a devise-sandbox
```
Check it out if you would like:<br>
<a href="https://devise-sandbox.herokuapp.com" target="_blank">https://devise-sandbox.herokuapp.com</a><br>
You need to make an account to see anything...

...and now we build.

