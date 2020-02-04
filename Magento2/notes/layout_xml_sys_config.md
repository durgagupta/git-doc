In this tutorial, I will explain you about how to get config value in layout XML file in Magento 2. There are sometimes need to set value in layout XML file from system config which admin set value in system configuration from admin panel.

For example : Header and Footer link and label set from admin panel which admin want to set. At that time, we need to get value from system config and need to set in layout XML file.

Generally, we see that there are static value or text assign in layout XML. But, If you want to set value dynamically which was save from admin panel. Then, you need to follow this below steps :

You may also like this :

Create a simple module in Magento 2
Add new page layout option in Magento 2
After create simple module, you can continue below steps :

1) Create `system.xml` file for add field to set value on `app/code/RH/Helloworld/etc/adminhtml/` path :


    <?xml version="1.0"?>
    <!--
    /**
     * Copyright © Magento, Inc. All rights reserved.
     * See COPYING.txt for license details.
     */
    -->
    <config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:module:Magento_Config:etc/system_file.xsd">
        <system>
            <tab id="rh" translate="label" sortOrder="10">
                <label>RH</label>
            </tab>
            <section id="helloworld" translate="label" sortOrder="130" showInDefault="1" showInWebsite="1" showInStore="1">
                <class>separator-top</class>
                <label>RH Helloworld</label>
                <tab>rh</tab>
                <resource>RH_Helloworld::helloworld_config</resource>
                <group id="general" translate="label" type="text" sortOrder="10" showInDefault="1" showInWebsite="0" showInStore="0">
                    <label>General Configuration</label>
                    <field id="label_field" translate="label" type="text" sortOrder="1" showInDefault="1" showInWebsite="0" showInStore="0">
                        <label>Label</label>
                    </field>
                    <field id="path_field" translate="label" type="text" sortOrder="1" showInDefault="1" showInWebsite="0" showInStore="0">
                        <label>Path</label>
                    </field>
                </group>
            </section>
        </system>
    </config>
2) Create `default.xml` file at `app/code/RH/Helloworld/view/frontend/layout` with this below content :


    <?xml version="1.0"?>
    <!--
    /**
     * Copyright © Magento, Inc. All rights reserved.
     * See COPYING.txt for license details.
     */
    -->
    <page xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="urn:magento:framework:View/Layout/etc/page_configuration.xsd">
        <body>
            <referenceBlock name="header.links">
                <block class="Magento\Framework\View\Element\Html\Link" name="custom-link-header">
                    <arguments>
                        <argument name="label" xsi:type="helper" helper="RH\Helloworld\Helper\Data::getLabel" translate="true"/>
                        <argument name="path" xsi:type="helper" helper="RH\Helloworld\Helper\Data::getPath" translate="true"/>
                    </arguments>
                </block>
            </referenceBlock>
        </body>
    </page>

3) Create `Data.php` file in Helper at `app/code/RH/Helloworld/Helper/` for get value of system config with this below content :


    <?php
    
    /**
     * Copyright © Magento, Inc. All rights reserved.
     * See COPYING.txt for license details.
     */
    
    namespace RH\Helloworld\Helper;
    
    class Data extends \Magento\Framework\App\Helper\AbstractHelper {
        
        const LABEL_FIELD = 'helloworld/general/label_field';
    
        const PATH_FIELD = 'helloworld/general/path_field';
    
        /**
         * @var \Magento\Framework\App\Config\ScopeConfigInterface
         */
        protected $scopeConfig;
    
        /**
         * @param \Magento\Framework\App\Helper\Context   $context
         * @param \Magento\Framework\App\Config\ScopeConfigInterface $scopeConfig
         */
        public function __construct(
            \Magento\Framework\App\Helper\Context $context,
            \Magento\Framework\App\Config\ScopeConfigInterface $scopeConfig
        ){
            $this->scopeConfig = $scopeConfig;
            parent::__construct($context);
        }
    
        public function getLabel() {
            return $this->scopeConfig->getValue(self::LABEL_FIELD,\Magento\Store\Model\ScopeInterface::SCOPE_STORE);
        }
    
        public function getPath() {
            return $this->scopeConfig->getValue(self::PATH_FIELD,\Magento\Store\Model\ScopeInterface::SCOPE_STORE);
        }
    }

Now, Add value of label and path from configuration and save value. Then, Just need to clean cache and check at front-end side. You will see link in header which you set from admin panel.

So, this type you can get config value in layout XML file. You can get value from admin in any XML file using `xsi:type="helper"` and get value from helper file.

I hope this blog will helpful for easily understand about how to get config value in layout XML file in Magento 2. In case, I missed anything or need to add some information, always feel free to leave a comment in this blog, I’ll get back with proper solution 🙂