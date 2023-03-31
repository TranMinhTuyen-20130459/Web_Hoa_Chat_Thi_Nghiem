function notEmpty(inputText, notify) {
    inputText.onblur = function (){
        var valueOfText = inputText.value;
        var checkValue = valueOfText.trim() ? undefined : "Vui long nhap truong nay";
        if(checkValue){
            notify.innerHTML = checkValue;
        }else{
            notify.innerHTML = "";
        }
    }
}