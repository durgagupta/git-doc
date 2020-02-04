### Magento 2 request flow

##### Frontend route
###### Routes.xml

To register a frontend route, we must create a routes.xml file:

File: `app/code/Ace/HelloWorld/etc/frontend/routes.xml`

    <?xml version="1.0" ?>
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
        <!--Use router 'standard' for frontend route-->
        <router id="standard">
            <!--Define a custom route with id and frontName-->
            <route frontName="helloworld" id="helloworld">
                <!--The module which this route match to-->
                <module name="Ace_HelloWorld"/>
            </route>
        </router>
    </config>
    
* The `id` attribute is a unique string which will identify this route. You will use this string to declare the layout handle for the action of this module
* The `frontName` attribute is also a unique string which will be shown on the url request. For example, if you declare a route like below
     
      <route frontName="helloworld" id="helloworld">
     
 The url to this module should be:
 
    http://aceextensions.com/index.php/helloworld/controller/action
     
And the layout handle for this action is: `helloworld_controller_action.xml` So with this example path, 
you must create the action class in below folder
 
    {namespace}/{module}/Controller/{Controller}/{Action}.php
 
 ##### Admin route
 
 Admin route will be same as the frontend route but you must declare it in `adminhtml` folder with router id is admin.
 
 File: `app/code/Ace/HelloWorld/etc/adminhtml/routes.xml`
 
     <?xml version="1.0"?>
     <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:App/etc/routes.xsd">
         <!--Use router 'admin' for admin route -->
         <router id="admin">
             <!--Define a custom route with id and frontName -->
             <route id="ace_helloworld" frontName="ace_helloworld">
                 <!--The module which this route match to-->
                 <module name="Ace_HelloWorld"/>
             </route>
         </router>
     </config>
     
 The url of the admin page is the same structure with frontend page, but the `admin_area` name will be added before `route_frontName` to recognize this is a admin router. For example, 
 
    http://example.com/index.php/admin/ace_helloworld/controller/action
 
 The controller action for admin page will be added inside of the folder Controller/Adminhtml. For example for above url:
 
    {namespace}/{module}/Controller/Adminhtml/{Controller}/{Action}.php
