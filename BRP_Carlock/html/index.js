$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('http://brp_carlock/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('http://brp_carlock/exit', JSON.stringify({}));
        return
    })
    //when the user clicks on the submit button, it will run
    $("#submit").click(function () {
        $.post('http://brp_carlock/main', JSON.stringify({
            
        }));
        return;
    })
    $("#submit2").click(function () {
        $.post('http://brp_carlock/main2', JSON.stringify({
            
        }));
        return;
    })
    $("#submit3").click(function () {
        $.post('http://brp_carlock/main3', JSON.stringify({
            
        }));
        return;
    })
    $("#submit4").click(function () {
        $.post('http://brp_carlock/main4', JSON.stringify({
            
        }));
        return;
    })
})
