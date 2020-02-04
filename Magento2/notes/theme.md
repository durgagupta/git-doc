##How to override a phtml file from a custom module in magento 2?

#### Method 1: Override a phtml file using a custom module in Magento 2 with plugin

In this method, we use the method to create plugin in Magento 2

1. Create di.xml file in app\code\[Vendor]\[Namespace]\etc

    <?xml version="1.0"?>
        <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xsi:noNamespaceSchemaLocation="urn:magento:framework:ObjectManager/etc/config.xsd">
            <type name="Magento\Catalog\Block\Product\View\Type\Simple">
                <plugin name="custom-template" type="[Vendor]\[Namespace]\Plugin\Block\Product\View\Type\Simple" />
            </type>
        </config>

2. Create Simple.php file in app\code\[Vendor]\[Namespace]\Plugin\Block\Product\View\Type

        <?php
            namespace [Vendor]\[Namespace]\Plugin\Catalog\Block;
            
            class Simple
            {
                public function beforeToHtml(\Magento\Catalog\Block\Product\View\Type\Simple $block)
                {
                    $block->setTemplate('[Vendor]_[Namespace]::product/view/type/default.phtml');
                }
            }
#### Method 2: Override a phtml file using a custom module in Magento 2 with xml
Create catalog_product_view_type_simple.xml file in app\code\[Vendor]\[Namespace]\view\frontend\layout

    <page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
            <body>        
                <referenceBlock name="product.info.simple">
                    <action method="setTemplate">
                        <argument name="template" xsi:type="string">[Vendor]_[Namespace]::product/view/type/default.phtml</argument>
                    </action>
                </referenceBlock>
            </body>
     </page>