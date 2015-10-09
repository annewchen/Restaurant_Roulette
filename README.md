# Restaurant_Roulette
Allowing groups to make quick restaurant choices. Every member of group gets to vote on 2 specific preferences for a restaurant. App will return a random restaurant and its details.

## [Schedule](./schedule.md)
## [Individual Goals](./individual_goals.md)
##User Stories
Planner can:
<ul>
  <li>A planner can register/login/logout</li>
  <li>A planner can view/Add phone numbers of friends</li>
  <li>A planner can select friends by their name/alias</li>
  <li>A planner can send texts out to selected friends</li>
  <li>A planner can input requested restaurant location (City and State)</li>
  <li>A planner can automatically get a text with a link to a form</li>
</ul>

Friend can:
<ul>
  <li>A friend can view a text with a link to a form</li>
  <li>A friend canselect 2 preferences on the form out of a total of 5</li>
  <li>A friend cansubmit a form</li>
</ul>

Users can:
<ul>
  <li>Both planner and friends can receive a text with the decided restaurant details</li>
</ul>

## [Git Workflow](https://gist.github.com/mikelikesbikes/ccbf4c7fd90e647138c6)
###Set Up

<ul>
<li>Single repo which everyone else clones</li>
<li>Everyone get on “development-branch” and make branches named after your slice</li>
</ul>

###BEFORE PUSHING STEPS:
<p>
Did you write tests? Did those tests pass? Did you make a team annoucment about pushing? Did you show your team that your slice/feature works?
</p>
<ul>
<li>git co development-branch</li>
<li>git fetch origin</li>
<li>git merge origin/development-branch</li>
<li>git co my-slice-branch</li>
<li>git merge development-branch</li>
###THEN PUSH
<li>git push origin my-slice-branch</li>
</ul>

## Technologies
For Minimal Viable Product:
<ul>
  <li><a href="http://guides.rubyonrails.org/">Ruby on Rails</a></li>
  <li><a href="https://github.com/Yelp/yelp-ruby">Yelp API</a></li>
  <li><a href="https://www.twilio.com/docs/api">Twilio</a></li>
  <li><a href="https://github.com/yhordi/testing-and-code-coverage/tree/construction">Testing Selenium</a></li>
</ul>
Nice to Have:
<ul>
  <li>Meteor - make into phone app</li>
  <li>Bootstrap - frontend</li>
  <li>Heruko - deployment</li>
</ul>
[!Tech_Whiteboarding](./imgs/tech_architecture.jpg)
