function addItem(quantity, e) {
    var totalamout = parseInt($('.total-amount').text());
    if (totalamout <= 0) {
        alert("Sản phẩm này đã hết hàng trong kho nên không thêm vào giỏ hàng được!");
        return false;
    } else if (totalamout - parseInt(quantity) < 0) {
        alert("Sản phẩm cần mua chênh lệch cho với sản phẩm còn trong kho nên không thêm vào giỏ hàng được!");
        return false;
    } else {
        var cartCount = parseInt($('.hd-cart-item').text()) + parseInt(quantity);
        $('.hd-cart-item').text(cartCount);
        $('.total-amount').text(totalamout - quantity);
    }
}