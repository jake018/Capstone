<div class="content py-3">
    <div class="card card-outline card-primary shadow rounded-0">
        <div class="card-header">
            <div class="h5 card-title">Checkout</div>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-8">
                    <form action="" id="checkout-form">
                        <div class="form-group">
                            <label for="delivery_address" class="control-label">Delivery Address</label>
                            <textarea name="delivery_address" id="delivery_address" rows="4" class="form-control rounded-0" required><?= $_settings->userdata('address') ?></textarea>
                        </div>
                        <div class="form-group">
                            <label for="contact" class="control-label">Contact Number</label>
                            <textarea name="contact" id="contact" rows="1" class="form-control rounded-0" required><?= $_settings->userdata('contact') ?></textarea>
                        </div>
                     <!-- Your existing HTML form -->
<div class="form-group">
    <label for="payment_method" class="control-label">Payment Method</label>
    <select name="payment_method" id="payment_method" class="form-control" required>
        <option value="">Select Payment Method</option>
        <option value="maya">Maya</option>
        <option value="gcash">Gcash</option>
        <option value="cod">Cash on Delivery</option>
        <!-- Add more payment options here -->
    </select>
</div>

<!-- Dropdown content for Maya payment -->
<div id="mayaDropdown" style="display: none;">
    <!-- Add content for the Maya payment method dropdown here -->
    <!-- For example: -->
    <p>Instructions for making a payment through Maya.</p>
</div>

<!-- Dropdown content for Gcash payment -->
<div id="gcashDropdown" style="display: none;">
    <!-- Add content for the Gcash payment method dropdown here -->
    <!-- For example: -->
    <p>Instructions for making a payment through Gcash.</p>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // Function to show the dropdown content for Maya
        function showMayaDropdown() {
            document.getElementById("mayaDropdown").style.display = "block";
            document.getElementById("gcashDropdown").style.display = "none";
        }

        // Function to show the dropdown content for Gcash
        function showGcashDropdown() {
            document.getElementById("mayaDropdown").style.display = "none";
            document.getElementById("gcashDropdown").style.display = "block";
        }
                // Function to hide all dropdown content
                function hideAllDropdowns() {
            document.getElementById("mayaDropdown").style.display = "none";
            document.getElementById("gcashDropdown").style.display = "none";
        }

        // Event listener for the payment method select
        document.getElementById("payment_method").addEventListener("change", function() {
            var selectedMethod = this.value;
            if (selectedMethod === "maya") {
                showMayaDropdown();
            } else if (selectedMethod === "gcash") {
                showGcashDropdown();
            } else {
                // If neither Maya nor Gcash is selected, hide all dropdown content
                hideAllDropdowns();
            }
        });

        // Event listener to close the dropdown content if the user clicks outside
        document.addEventListener("click", function(event) {
            var targetElement = event.target;
            var mayaDropdown = document.getElementById("mayaDropdown");
            var gcashDropdown = document.getElementById("gcashDropdown");
            var paymentMethodSelect = document.getElementById("payment_method");

            if (targetElement !== paymentMethodSelect && !paymentMethodSelect.contains(targetElement)) {
                // Clicked outside the payment method select, hide all dropdown content
                hideAllDropdowns();
            }
        });
    });
</script>


                       
                        <!-- Add more payment fields based on the selected payment method -->
                        <div class="form-group text-right">
                            <button class="btn btn-flat btn-default btn-sm bg-navy">Place Order</button>
                        </div>
                    </form>
                </div>
                <div class="col-md-4">
                    <div class="row" id="summary">
                        <div class="col-12 border">
                            <h2 class="text-center"><b>Summary</b></h2>
                        </div>
                        <?php 
                        $gtotal = 0;
                        $shippingCost = 50.00; // Shipping cost value
                        $vendors = $conn->query("SELECT * FROM `vendor_list` where id in (SELECT vendor_id from product_list where id in (SELECT product_id FROM `cart_list` where client_id ='{$_settings->userdata('id')}')) order by `shop_name` asc");
                        while($vrow=$vendors->fetch_assoc()):    
                            $vtotal = $conn->query("SELECT sum(c.quantity * p.price) FROM `cart_list` c inner join product_list p on c.product_id = p.id where c.client_id = '{$_settings->userdata('id')}' and p.vendor_id = '{$vrow['id']}'")->fetch_array()[0];   
                            $vtotal = $vtotal > 0 ? $vtotal : 0;
                            $gtotal += $vtotal;
                        ?>
                        <div class="col-12 border item">
                            <b class="text-muted"><small><?= $vrow['code']." - ".$vrow['shop_name'] ?></small></b>
                            <div class="text-right">₱<b><?= format_num($vtotal) ?></b></div>
                        </div>
                        <?php endwhile; ?>
                        <div class="col-12 border">
                            <b class="text-muted">Shipping Cost</b>
                            <div class="text-right">₱<?= format_num($shippingCost) ?></div>
                        </div>
                        <div class="col-12 border">
                            <b class="text-muted">Grand Total</b>
                            <?php 
                            $gtotal += $shippingCost; // Adding shipping cost to the grand total
                            ?>
                            <div class="text-right h3" id="total">₱<b><?= format_num($gtotal) ?></b></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $('#checkout-form').submit(function(e){
        e.preventDefault();
        var _this = $(this);
        if (_this[0].checkValidity() == false) {
            _this[0].reportValidity();
            return false;
        }
        if ($('#summary .item').length <= 0) {
            alert_toast("There is no order listed in the cart yet.",'error');
            return false;
        }
        $('.pop_msg').remove();
        var el = $('<div>');
        el.addClass("alert alert-danger pop_msg");
        el.hide();
        start_loader();
        $.ajax({
            url: _base_url_+'classes/Master.php?f=place_order',
            method: 'POST',
            data: _this.serialize(),
            dataType: 'json',
            error: err => {
                console.error(err);
                alert_toast("An error occurred.",'error');
                end_loader();
            },
            success: function(resp) {
                if (resp.status == 'success') {
                    location.replace('./?page=products');
                } else if (!!resp.msg) {
                    el.text(resp.msg);
                    _this.prepend(el);
                    el.show('slow');
                    $('html,body').scrollTop(0);
                } else {
                    el.text("An error occurred.");
                    _this.prepend(el);
                    el.show('slow');
                    $('html,body').scrollTop(0);
                }
                end_loader();
            }
        });
    });

    // Show/hide additional payment fields based on the selected payment method
    $('#payment_method').change(function() {
        var selectedMethod = $(this).val();
        $('.additional-payment-fields').hide(); // Hide all additional payment fields
        $('#' + selectedMethod + '_fields').show(); // Show the specific additional fields for the selected payment method
    });
</script>
