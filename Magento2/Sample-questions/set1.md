
1. You are working with an OMS(Magento Order Management System ) that requires you to add an attribute to the order API. How do you add a field to the existing sales API?

Select one of the following:
   
    
    a) You create an install script to add a column to the sales table and Magento will automatically pull in the information
    
    b) You update Magento\Sales\Api\OrderManagementInterface and
    Magento\Sales\Api\Data\OrderInterface to add your field
    
    
    c) You create an etc/webapi.xml file and add the new field as an item to the route, as shown in the following code: <route url="/V1/orders" method="GET" >
    <service class= "Magento\Sales\Api\OrderRepositoryInterface" method="getList"> <item name="my_new_attribute" xsi:type="string" /> </service>
    <resources> <resource ref="Magento_Sales::sales" /> </resources>
    </route>
    
    # d) You add an extension attribute to Magento\Sales\Api\Data\OrderInterface to include the new field
   
   
2. You are working on a custom form in the Admin and the form is too lengthy. To organize the form better, you decide to group the fields into multiple tabs. How do you achieve this?

Select one of the following:
   
        a) Create a plugin for the method
        MyCompany\MyModule\Block\Adminhtml\Form\Edit\Tabs::toHtml()
    
        b) Add the fields into <tab> nodes in the customer_account_edit.xml layout file</p>
    
        #c) Add the fields into a <fieldset> node in the existing form in the ui_component XML file</p>
    
        d) Add a new form for the field group in the ui_component XML file</p>
        
        
3) Cross-site scripting, or XSS, is a security vulnerability that can be found in web applications, Magento extension developers should be aware of these vulnerabilities to avoid introducing them in their code. In Magento mainly three types of XSS vulnerabilities:
   
   Select one or more of the following:
   
       #a) DOM XSS
       
       b) SQL Injection
       
       #c) Persisted XSS
       
       d) Cross Site Scripting Admin
       
       #e) Reflected (non-persistent) XSS
   
4) In your phtml template file you need to output a URL inside a JavaScript context. var url = '<?= /* code here */ ?>'; Which two methods allow you to keep the output XSS-safe?
   
   Select one or more of the following:
   
       a) escapeHtmlAttr
       b) escapeHtml
       #c) escapeUrl
       #d) escapeJs
       
       
5) You are creating a new indexer which must run after the targetrule_product_rule index process. When you run bin/magento indexer:reindex, your rule always runs first creating inaccurate data. What is the resolution?
   
   Select one of the following:
   
       a) Specify the sortOrder in your indexer configuration.
       b) Create a bash script to execute each indexer in the correct order.
       #c) Use a dependencies node in your indexer configuration.
       d) Use a plugin on the IndexManager class to change load order.
       
6) You are making some changes to your existing action controller
   
       \MyCompany\MyModule\Controller\Index\Index
       
       public function __construct( \Magento\Framework\App\Action\Context $context,
       <new dependency here>, \Magento\Framework\View\Result\PageFactory $resultPageFactory){
       
       You want to inject a new dependency to the controller, but you encounter the following error after flushing the cache and
       reloading the page: Recoverable Error: Argument 2 passed to MyCompany\MyModule\Controller\Index\Index::__construct() must be an instance of <new dependency class> ...How do you fix the error?
   
   Select one of the following:
   
       a) New dependencies must be added at the end of the constructor signature because dependencies cannot be added in the middle of existing constructors
       
       b) Clean the config cache that contains all constructor signatures.
       
       c) Configure the new argument in di.xml for the controller class.
       
       # d) Remove the generated child class from generated/code that is calling the parent constructor with the old signature.  
   
   
7. Magento Input Processing Any request data can be manipulated by attackers and can contain malicious values such as: (Select 4)
   
   Select one or more of the following:
   
       #a) URIs contaings fake parts/query parameters
       
       #b) headers containg false IDs
       
       c) tampered Cache
       
       d) tampered KnockoutJS
       
       #e) tampered cookies
       
       #f) form fields filled with control characters (“<”, “>” etc)
       
Explanation: 

    Input Processing
    Any request data can be manipulated by attackers and can contain malicious values such as:
       
       form fields filled with control characters (“<”, “>” etc)
       headers containg false IDs
       URIs contaings fake parts/query parameters
       tampered cookies
       To combat this developers, must validate any value coming in from requests.
       
       https://devdocs.magento.com/guides/v2.3/extension-dev-guide/xss-protection.html
       
       

8. You need to render a product attribute’s raw value as a variable in a script tag. This value will be used to initialize an application on the frontend.

Select one of the following:

    <?= $block->renderJs($value) ?>
    
    <?= $block->escapeJsVar($value) ?>
    
    #<?= $block->escapeJs($value) ?>
    
    <?= $block->escapeHtml($value) ?>
    
    
9. You are creating a module that will be sold on the Magento Marketplace. You wish for this module to be easily extensible, and decide to add the capability for other developers to utilize extension attributes. What is the minimum update necessary to enable this capability?
   
   Select one of the following:
   
   
    Ensure each model extends Magento\Framework\Model\AbstractExtensibleModel.
       
    Create a ExtensionAttributeInterface for each model.
    
    # Add the getAttributeExtensions() method and implement ExtensionAttributesInterface in each model.
    
    Configure your models in etc/extension_attributes.xml.
    
10. You are exploring the customer segment module and find this code in frontend/di.xml: <type name="Magento\Framework\View\Layout"> <plugin name="customer-segment-session-depersonalize" type= "Magento\CustomerSegment\Model\Layout\DepersonalizePlugin" sortOrder="15"/> </type> What effect does this plugin have for customer segments?
    
    Select one of the following:
    
    
    It cleans the intermediate data of the segment-website and the segment-customer mapping in the tables to improve performance
    
    It passes the segment information to the HttpContext from the customer session
    
    # It cleans the segment and customer related entities from the session
    
    It passes the segment information to the Knockout JS model from the customer session
    
    
11. You need to add a new column to the sales_shipment and the sales_shipment_grid tables. Other than utilizing the default addColumn methods, what way is automatic?
    
    Select one of the following:
    
        On the ModuleDataSetupInterface, call $setup->getSales()->addColumn()
        
        On the default EavSetup class, utilize the addColumn method.
        
        Ensure your UpgradeSchema class extends CoreSetup and call $this->addSalesColumns().
        
        # Utilize the SalesSetup class’ addAttribute method.