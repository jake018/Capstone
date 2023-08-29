<style>
    
</style>
<div class="col-lg-12 py-5">
    <div class="contain-fluid">
        <div class="card card-outline card-dark shadow rounded-0">
            
                </div>
            </div>
        </div>
        <div class="clear-fix mb-3"></div>
        <h3 class="text-center"><b>Products</b></h3>
        <center><hr class="w-25"></center>
        <div class="row" id="product_list">
            <?php 
            $products = $conn->query("SELECT p.*, v.shop_name as vendor, c.name as `category` FROM `product_list` p inner join vendor_list v on p.vendor_id = v.id inner join category_list c on p.category_id = c.id where p.delete_flag = 0 and p.`status` =1 order by RAND() limit 4");
            while($row = $products->fetch_assoc()):
            ?>
            <div class="col-lg-3 col-md-6 col-sm-12 product-item">
                <a href="./?page=products/view_product&id=<?= $row['id'] ?>" class="card shadow rounded-0 text-reset text-decoration-none">
                <div class="product-img-holder position-relative">
                    <img src="<?= validate_image($row['image_path']) ?>" alt="Product-image" class="img-top product-img bg-gradient-gray">
                </div>
                    <div class="card-body border-top border-gray">
                        <h5 class="card-title text-truncate w-100"><?= $row['name'] ?></h5>
                        <div class="d-flex w-100">
                        <div class="col-auto px-0"><h6 class="text-muted">Vendor: </h6></div>
                                                    <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="text-truncate m-0"><h6 class="text-muted"><?= $row['vendor'] ?></h6></p></div>
                        </div>
                        <div class="d-flex">
                        <div class="col-auto px-0"><h7 class="text-muted">Category: </h7></div>
                                                    <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="text-truncate m-0"><h7 class="text-muted"><?= $row['category'] ?></h7></p></div>
                        </div>
                        <div class="d-flex">
                        <div class="col-auto px-0"><h5 class="text-muted"> Price : ₱ </h5></div>
                                                    <div class="col-auto px-0 flex-shrink-1 flex-grow-1"><p class="m-0 pl-3"><h5 class="text-primary"><?= format_num($row['price']) ?></h5></p></div>
                        </div>
                        <div class="text-center mt-3">
                <button class="btn btn-primary btn-sm" onclick="addToCart(<?= $row['id'] ?>)">Add to Cart</button>
            </div>
            <script>
    function addToCart(productId) {
        var qty = 1; // Set the quantity to 1 for now (you can modify this according to your requirements)
        var el = $('<div>');
        el.addClass('alert alert-danger');
        el.hide();
        $('#msg').html('');
        start_loader();
        $.ajax({
            url: _base_url_+'classes/Master.php?f=add_to_cart',
            method: 'POST',
            data: { product_id: productId, quantity: qty },
            dataType: 'json',
            error: function(err) {
                console.error(err);
                alert_toast('An error occurred.', 'error');
                end_loader();
            },
            success: function(resp) {
                if (resp.status == 'success') {
                    // Show a success message or update the cart count
                    alert_toast('Product added to cart successfully!', 'success');
                    // You can update the cart count or perform any other actions here
                } else if (!!resp.msg) {
                    el.text(resp.msg);
                    $('#msg').append(el);
                    el.show('slow');
                    $('html, body').scrollTop(0);
                } else {
                    el.text("An error occurred. Please try to refresh this page.");
                    $('#msg').append(el);
                    el.show('slow');
                    $('html, body').scrollTop(0);
                }
                end_loader();
            }
        });
    }

    $(function(){
        $('#add_to_cart').click(function(){
            if('<?= $_settings->userdata('id') > 0 && $_settings->userdata('login_type') == 3 ?>'){
                addToCart('<?= isset($id) ? $id : '' ?>');
            }else{
                location.href = "./login.php";
            }
        });
    });
</script>
                    </div>
                </a>
            </div>
            <?php endwhile; ?>
        </div>
        <div class="clear-fix mb-2"></div>
        <div class="text-center">
            <a href="./?page=products" class="btn btn-large btn-primary rounded-pill col-lg-3 col-md-5 col-sm-12">Explore More Products</a>
        </div>
    </div>
</div>