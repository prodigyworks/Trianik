<?php
    require_once(__DIR__ . "/../../../application/template/web/system-header.php");
    require_once(__DIR__ . "/../../../library/tinymce/tinymce.php");
    require_once(__DIR__ . "/../../../library/core/ui/ComboUIClass.php");
?>
    <style>
        #errors {
            width:100%;
        }
    </style>
    <div class='scroller portlet'>
        <h4 class='portletheader'><?php echo SessionControllerClass::getPage()->getLabel(); ?></h4>
        <div class='gridboundary'>
            <div id="errors">
                <?php
                    if (file_exists(__DIR__ . "/tmp/php-error.log")) {
                        echo str_replace("\n", "<br>", file_get_contents(__DIR__ . "/../../../tmp/php-error.log"));

                    } else {
                        echo "No errors found";
                    }
                ?>
            </div>
        </div>
        <button id="clearbutton" class="link3 pad5"><img alt="Clear" src="<?php echo ImageClass::staticURL("clear.png"); ?>" /> Clear</button>
    </div>
    <script>
        $(document).ready(
            function() {
                $("#clearbutton").click(
                    function() {
                        businessObjectToJSon({
                            domain: "<?php echo SessionControllerClass::getSiteConfig()->getDomainurl(); ?>",
                            classname: "AdminUIClass",
                            path: "application/admin/ui",
                            methodname: "clearErrorLog",
                            success: function() {
                                toastr.success("Errors cleaned", "<?php echo SessionControllerClass::getSiteConfig()->getCompanyname(); ?>");

                                $("#errors").html("No errors found");
                            }
                        });
                    }
                )
            }
        )
    </script>
<?php
    require_once(__DIR__ . "/../../../application/template/web/system-footer.php");