<?php
$category_ids = isset($_GET['cids']) ? $_GET['cids'] : 'all';
$min_price = isset($_GET['min_price']) ? $_GET['min_price'] : '';
$max_price = isset($_GET['max_price']) ? $_GET['max_price'] : '';

?>
<div class="content py-2">
    <div class="row">
        <div class="col-md-3">
            <div class="card card-outline rounded-0 card-primary shadow">
                <div class="card-body">
                    <div class="list-group">
                        <div class="list-group-item list-group-item-action">
                            <div class="custom-control custom-checkbox">
                                <input class="custom-control-input custom-control-input-primary custom-control-input-outline cat_all" type="checkbox" id="cat_all" <?= !is_array($category_ids) && $category_ids =='all' ? "checked" : "" ?>>
                                <label for="cat_all" class="custom-control-label"> All</label>
                            </div>
                        </div>
                        <?php 
                        $categories = $conn->query("SELECT * FROM `category_list` where delete_flag = 0 and status = 1 order by `name` asc ");
                        while ($row = $categories->fetch_assoc()):
                        ?>
                        <div class="list-group-item list-group-item-action">
                            <div class="custom-control custom-checkbox">
                                <input class="custom-control-input custom-control-input-primary custom-control-input-outline cat_item" type="checkbox" id="cat_item<?= $row['id'] ?>" <?= in_array($row['id'],explode(',',$category_ids)) ? "checked" : '' ?> value="<?= $row['id'] ?>">
                                <label for="cat_item<?= $row['id'] ?>" class="custom-control-label"> <?= $row['name'] ?></label>
                            </div>
                        </div>
                        <?php endwhile; ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="card card-outline card-primary shadow rounded-0">
                <div class="card-body">
                    <div class="container-fluid">
                        <div class="row justify-content-center mb-3">
                            <div class="col-lg-8 col-md-10 col-sm-12">
                                <form action="" id="search-frm">
                                    <div class="input-group">
                                        <div class="input-group-prepend"><span class="input-group-text">Search</span></div>
                                        <input type="search" id="search" class="form-control" value="<?= isset($_GET['search']) ? $_GET['search'] : '' ?>">
                                        <div class="input-group-append"><span class="input-group-text"><i class="fa fa-search"></i></span></div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <form action="" id="price-filter-form">
                                    <div class="form-group">
                                        <label for="min_price">Min Price</label>
                                        <input type="number" id="min_price" name="min_price" class="form-control" value="<?= $min_price ?>" placeholder="Enter min price">
                                    </div>
                                    <div class="form-group">
                                        <label for="max_price">Max Price</label>
                                        <input type="number" id="max_price" name="max_price" class="form-control" value="<?= $max_price ?>" placeholder="Enter max price">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Filter</button>
                                    <a href="./?page=products" class="btn btn-danger">Reset</a>
                                </form>
                            </div>
                        </div>
                        <br>
                        <div class="row" id="product_list">
                            <?php
                            $swhere = "";
                            if (!empty($category_ids)) {
                                if ($category_ids != 'all') {
                                    $swhere = " and p.category_id IN ({$category_ids}) ";
                                }
                                if (isset($_GET['search']) && !empty($_GET['search'])) {
                                    $swhere .= " and (p.name LIKE '%{$_GET['search']}%' or p.description LIKE '%{$_GET['search']}%' or c.name LIKE '%{$_GET['search']}%' or v.shop_name LIKE '%{$_GET['search']}%') ";
                                }
                                if ($min_price !== '') {
                                    $swhere .= " and p.price >= {$min_price} ";
                                }
                                if ($max_price !== '') {
                                    $swhere .= " and p.price <= {$max_price} ";
                                }

                                $products = $conn->query("SELECT p.*, v.shop_name as vendor, c.name as `category` FROM `product_list` p inner join vendor_list v on p.vendor_id = v.id inner join category_list c on p.category_id = c.id where p.delete_flag = 0 and p.`status` = 1 {$swhere} order by RAND()");
                                while ($row = $products->fetch_assoc()):
                            ?>
                                    <div class="col-lg-4 col-md-6 col-sm-9 product-item">
                                        <a href="./?page=products/view_product&id=<?= $row['id'] ?>" class="card shadow rounded-0 text-reset text-decoration-none">
                                            <div class="product-img-holder position-relative">
                                                <img src="<?= validate_image($row['image_path']) ?>" alt="Product-image" class="img-top product-img bg-gradient-gray">
                                            </div>
                                            <div class="card-body border-top p-5 border-danger">
                                                <h2 class="card-title text-truncate w-100"><?= $row['name'] ?></h2>
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
                                            </div>
                                        </a>
                                    </div>
                            <?php
                                endwhile;
                            } else {
                            ?>
                                <div class="col-12 text-center">
                                    Please select at least 1 product category.
                                </div>
                            <?php
                            }
                            ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
                showPopupMessage('An error occurred.', 'error');
                end_loader();
            },
            success: function(resp) {
                if (resp.status == 'success') {
                    showPopupMessage('Product added to cart successfully!', 'success');
                    // Reduce the stock quantity
                    updateStockQuantity(productId, qty);
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

    function updateStockQuantity(productId, quantity) {
        $.ajax({
            url: _base_url_+'classes/Master.php?f=update_stock_quantity',
            method: 'POST',
            data: { product_id: productId, quantity: quantity },
            dataType: 'json',
            error: function(err) {
                console.error(err);
            },
            success: function(resp) {
                if (resp.status == 'success') {
                    console.log('Stock quantity updated successfully!');
                } else {
                    console.log('Failed to update stock quantity.');
                }
            }
        });
    }

    function showPopupMessage(message, type) {
        // Implement your popup message logic here
        // For example, you can use Bootstrap toast to display the message
        var toast = $('<div class="toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="2000">');
        toast.addClass(type === 'success' ? 'toast-success' : 'toast-error');
        var toastBody = $('<div class="toast-body">').text(message);
        toast.append(toastBody);
        $('.toast-container').append(toast);
        toast.toast('show');
    }

    $(function(){
        if ($('#cat_all').is(':checked') == true) {
            $('.cat_item').prop('checked', true);
        }
        if ($('.cat_item:checked').length == $('.cat_item').length) {
            $('#cat_all').prop('checked', true);
        }
        $('.cat_item').change(function(){
            var ids = [];
            $('.cat_item:checked').each(function(){
                ids.push($(this).val());
            });
            location.href = "./?page=products&cids=" + (ids.join(","));
        });

        $('#search-frm').submit(function(e){
            e.preventDefault();
            var q = "search=" + $('#search').val();
            if ('<?= !empty($category_ids) && $category_ids != 'all' ?>' == 1) {
                q += "&cids=<?= $category_ids ?>";
            }
            location.href = "./?page=products&" + q;
        });

        $('#price-filter-form').submit(function(e){
            e.preventDefault();
            var minPrice = $('#min_price').val();
            var maxPrice = $('#max_price').val();
            var params = '';

            if (minPrice !== '') {
                params += 'min_price=' + minPrice + '&';
            }

            if (maxPrice !== '') {
                params += 'max_price=' + maxPrice + '&';
            }

            if ('<?= !empty($category_ids) && $category_ids != 'all' ?>' == 1) {
                params += 'cids=<?= $category_ids ?>&';
            }

            location.href = './?page=products&' + params.slice(0, -1);
        });
    });
</script>
