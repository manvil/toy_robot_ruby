# Toy Robot Simulator

#### What this tool is about?
* This is a simple ruby tool that simulates the movements of a robot on a table top.

#### What are the rules of the game?
Click [here](https://drive.google.com/open?id=0B5PS3EHB5K-bOEh0dzlQZjFwckk)

#### PREREQUISITES
* Ruby verison 1.9.3 or above has to be installed on the machine

#### How to use it?
* Setup up ruby on your machine (greater than 1.9.3)
* Run the command `ruby path_to_folder/start.rb`

#### SAMPLE
###### 1:

    manvil@macbook ~/src/toy_robot$ ruby start.rb                                            
    Please enter your commands. Type exit for quitting.
    Place 0,0,north
    move
    right
    move
    report
    Output: 1,1,EAST
    exit

###### 2:

    manvil@macbook ~/src/toy_robot$ ruby start.rb                                            
    Please enter your commands. Type exit for quitting.
    Place 4,4,west
    move
    move
    left
    report
    Output: 2,4,SOUTH
    exit
    
> NOTE: The case of the commands does not matter.

#### Test
Run `ruby path_to_folder/test.rb`

#### LICENSE

Licensed under [MIT](http://mit-license.org).

#### CONTRIBUTING
As of now this is not allowed.

#### CONCLUSION
This project is a showcase of ruby's capabilities.