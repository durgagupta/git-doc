#### PhpStorm setup for magento code Quality

To set up default Magento's code quality tools, we will use PhpStorm.

First of all, we need to have a package `magento/magento-coding-standard` in your compose.json file.

Magento currently provides 3 kinds of tools:-
- Code Sniffer
- Mess Detector
- PHP CS Fixer

First thing first, we need to enable the above features from `Settings > Editor > Inspections`. Inside the PHP tree node, we can see Quality tools which you need to enable.

![Screenshot_from_2019-09-23_15-01-19](uploads/27241824915670af1834d843e2464f50/Screenshot_from_2019-09-23_15-01-19.png)


## Code Sniffer

If you have already installed the above module then you can see `Magento2` option in dropdown labeled “Coding standard”. If not then click reload icon button beside dropdown.

![Screenshot_from_2019-09-23_15-01-43](uploads/de4c4a5f5b64f9de94528a448cccf2e5/Screenshot_from_2019-09-23_15-01-43.png)

Then you need to verify if Code Sniffer is working properly.

![Screenshot_from_2019-09-23_15-02-56](uploads/9c17b8f14668142b28ad832c6df81126/Screenshot_from_2019-09-23_15-02-56.png)

![Screenshot_from_2019-09-23_15-03-55](uploads/2a9ba530b999dc7fb4ef47e65f62c2a2/Screenshot_from_2019-09-23_15-03-55.png)


## Mess Detector

To setup mess detector, we need to add custom rule sets like below:-

![Screenshot_from_2019-09-23_15-02-09](uploads/ddfdb10da3dbda3018eab046f5947f06/Screenshot_from_2019-09-23_15-02-09.png)

`Magento PHPMD rule set <Project_Dir>/dev/tests/static/testsuite/Magento/Test/Php/_files/phpmd/ruleset.xml`


## PHP CS Fixer

- Coming soon


## Code Quality Tools with Docker

When docker comes in, things get complicated, We need to setup dual-stack to run tools in the local stack and serve with docker stack.

Though we can set up remote CLI Interpreter for PHP from docker, it doesn't seem to work with tools. So, the local stack setup is required for now.


