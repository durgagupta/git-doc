##Magento 2: How to call custom phtml file in another phtml file?

    echo $this->getLayout()->createBlock("Magento\Framework\View\Element\Template")->setTemplate("Lapisbard_General::customer_account.phtml")->toHtml();
    
#### calling in xml layout file
    <block class="Magento\Framework\View\Element\Template" name="test_file" template="Magento_Theme::html/test.phtml"/>
    
#### Calling in blocks and cms pages
    {{block class="Magento\Framework\View\Element\Template" name="test_file" template="Magento_Theme::html/test.phtml"}}
    
#### Calling in any phtml file
    <?php include ($block->getTemplateFile('Magento_Theme::html/test.phtml')) ?>