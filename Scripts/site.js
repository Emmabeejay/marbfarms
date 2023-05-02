function payWithPaystack() {
    var handler = PaystackPop.setup({
        key: 'pk_test_c6c65bd63f59052ffd6b3cc2053917e44de85151',
        email: 'emmabeejay@gmail.com',
        amount: 10000,
        ref: '' + Math.floor((Math.random() * 1000000000) + 1), // generates a pseudo-unique reference. Please replace with a reference you generated. Or remove the line entirely so our API will generate one for you
        metadata: {
            custom_fields: [
                {
                    display_name: "Mobile Number",
                    variable_name: "mobile_number",
                    value: "+2348012345678"
                }
            ]
        },
        callback: function (response) {
            alert('success. transaction ref is ' + response.reference);
        },
        onClose: function () {
            alert('window closed');
        }
    });
    handler.openIframe();
}