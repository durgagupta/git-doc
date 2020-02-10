#### You are building out a new module and have created this file: app/code/MyCompany/MyModule/Controller/Index/Welcome.php
What is the namespace … for this file?

* `namespace MyCompany\MyModule\Controller\Index`
* namespace Magento\MyCompany\MyModule\Controller\Index
* namespace MyModule\Controller\Index\Welcome
* namespace MyCompany\MyModule\Controller\Index\Welcome

#### You are creating a controller path (and menu item) that must only be visible when the admin user has the appropriate ACL credentials. Here is the code you have written:
    <add id="MyCompany_MyModule::my_menu_item" 
        title="My Menu Item" 
        module="MyCompany_MyModule" 
        parent="Magento_Reports::report" 
        action="module/customer/index" 
        resource="Magento_Backend::admin"/>

Unfortunately, this menu item is always visible. 

What is the solution?
* `Change the resource attribute to a custom one as specified in your module’s etc/acl.xml.`
* Add a new attribute: acl=”...” (value being a custom ACL as specified in your module’s etc/acl.xml).
* Specify the ACL permission in the associated controller.
* Flush the cache.*

#### You are tasked with creating a new modu*le to render integrate with a chat client.

What three files are required by Magento for a skeleton module?
* `etc/module.xml`
* etc/events.xml
* `composer.json`
* Setup/UpgradeSchema.php
* `registration.php`

#### You have written the following into a setup script:
    $setup->getConnection()->addColumn(
        ‘mymodule_mytable’,
        'new_column',
        Table::TYPE_TEXT
    );

Unfortunately, someone had already manually created the column in the database and that is throwing an error: Column `new_column` already exists in `mymodule_mytable`. 

Keeping simplicity in mind, what do you add into an if-statement wrapping this code to prevent this error from happening again?

* $setup->getConnection()->getTable(‘mymodule_mytable’)->hasColumn('new_column')
* `$setup->getConnection()->tableColumnExists('mymodule_mytable', 'new_column')`
* $setup->getConnection()->fetchOne(‘SHOW COLUMNS FROM mymodule_mytable MATCHING new_column;’)
* $setup->getConnection()->fetchPairs('DESCRIBE mymodule_mytable;')[4]

#### You need to adjust the functionality of this method (defined in vendor/magento/module-quote/Model/Quote/Item/AbstractItem.php) for all classes that extend it:

    abstract public function getQuote();

How do you tap into this?

* Use a proxy class.
* Override all classes the extend `AbstractItem`
* Locate the closest place that an event is triggered and observe the event.
* `Use a plugin.`

#### You have built an ERP integration that manages products and the categories with which the products are associated. In this integration, you import the category product associations directly into the `catalog_category_product` table with a SQL script. Unfortunately, the products are not appearing. 

How do you make the products appear?

* `Re-index affected categories`.
* Clear the cache.
* Create a script to programmatically save each product.
* Import the same products into the catalog_product_category_fields table.


#### You are tasked with selecting all orders that are in the `pending` status from the database. This information will be displayed in the customer account area. Here is what you have written so far:

    $repository = $this->orderRepository;
    $repository->getList(/* … what goes here … */);

What code below will run in the above /* … what goes here … */ snippet?

* $repository->getFilter(‘status’, ‘processing’)
* `$this->searchCriteriaBuilder->addFilter(‘status’, ‘processing’)->create()`
* [‘status’ => [‘eq’ => ‘processing’]]
* $this->searchCriteriaBuilder->addFilter(‘status’, ‘processing’)

#### What is the correct hierarchy for the etc/acl.xml file?

* acl > elements > children > element > children …
* `acl > resources > resource > resource > resource …`
* acl > permissions > items > permission > items …
* acl > children > resource > children > resource …

#### You are performing a code review on a 3rd-party module and see this:
    $shippingEstimates = $this->shippingEstimatesFactory->create();
    $shippingEstimates->setName($name);
    $shippingEstimates->setTimeToDelivery($timeToDelivery);
    $shippingEstimates->save();

What change must be made to bring up to Magento coding standards?

* Instead of using magic methods, use the setData() method.
* Don’t use a factory, instead call the create method directly on the model.
* In the factory create method, an array of $data values should be sent.
* `Use the ShippingEstimates resource model to save the model, instead of calling the save method on the model itself.`

#### You are tasked with changing a column’s name in a module built for a merchant using Magento 2.3. 

After changing the column’s type in etc/db_schema.xml, what two actions do you take?

* `Use the migrateDataFrom keyphrase.`
* Create a patch file to delete the old column.
* Increase the module’s version.
* `Re-generate the module’s whitelist`

#### When a customer adds a configurable product to the shopping cart, how many rows are created in the quote_item table?*

* `2: one for the configurable product and one for the child product`
* 1: representing the configurable product
* 1: representing the child product
* 3: one for the configurable product, one to link the configurable and the child, and one for the child product

#### Magento provides a production mode that should be utilized when a site is publicly accessible. 
Why is it important to use this mode?

* Production mode always compiles the LESS style sheets.
* `Production mode prevents verbose error messages from being displayed to a visitor`.
* Production mode enables fast download times by enabling the caches.
* Production mode enables automatic nightly backups of customer data.


#### What is the default variable used in a template to access the template's rendering class?

* $this
* $logic
* `$block`
* $parent

#### You have copied a module’s code into the app/code directory and run bin/magento setup:upgrade. However, you are not able to browse to a page that should be available. 

 What is the solution?
* Navigate to the module’s configuration in Stores > Configuration and enable it.
* Double-check that all files were correctly copied.
* Run bin/magento cache:clean.
* `Run bin/magento module:enable [MODULE NAME].`