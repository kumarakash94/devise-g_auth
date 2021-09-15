# README
Need To Add <b> GOOGLE CLIENT ID </b> and <b> GOOGLE SECRET KEY </b> 
<p> Follow this link for <b> Google API </b>
 https://console.cloud.google.com/
  
 ## Add this line to the top of your application's Gemfile:

gem 'dotenv-rails', groups: [:development, :test]

 ## And then execute:

$ bundle
  and then
  $ touch .env
  
  ## Add your application configuration to your .env file in the root of your project:

  GOOGLE_CLIENT_ID=YOURSECRETKEYGOESHERE <br>
  GOOGLE_CLIENT_SECRET=YOURSECRETKEYGOESHERE
  
 ```diff
- NOTE: 
  ```
  <p>DON'T FORGET TO ADD <b> .env </b> IN YOUR <b> .gitignore </b>
