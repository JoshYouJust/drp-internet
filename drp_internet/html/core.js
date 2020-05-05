function goBack(){
    window.history.back();
}

function goForward(){
    window.history.forward();
}
$(document).ready(function(){
    function display(bool){
        if (bool===true) {
            $("body").css({"display":"block"});
        } 
        else{
            $("body").css({"display":"none"});
        }
    }

    display(false)

    window.addEventListener('message',function(event) {
        var lolz = event.data;
        if (lolz.type === "ui"){
            if(lolz.status === true){
                display(true)
            }
            else{
                display(false)
            }
        }
    })
    document.onkeyup = function (data){
        if (data.which == 27 ){
            $.post('http://drp_internet/exit', JSON.stringify({}));
            return
        }
    };

    $(".exitbtn").click(function(){
        $.post('http://drp_internet/exit', JSON.stringify({}));
        return
    })
})
