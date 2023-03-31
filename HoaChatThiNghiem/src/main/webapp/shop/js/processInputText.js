function notEmpty(inputText, notify) {
    inputText.onblur = function (){
        var valueOfText = inputText.value;
        var checkValue = valueOfText.trim() ? undefined : "Vui lòng nhập trường này";
        if(checkValue){
            notify.innerHTML = checkValue;
        }else{
            notify.innerHTML = "";
        }
    }
}
function notEmptyAndMinimum(inputText, notify, text) {
    inputText.onblur = function (){
        var valueOfText = inputText.value;
        var checkValue = valueOfText.trim() ? undefined : "Vui lòng nhập trường này";
        if(checkValue){
            notify.innerHTML = checkValue;
        }else{
            if(valueOfText.length < 8){
                notify.innerHTML = text + " phải tối thiểu 6 kí tự"
            }else{
                notify.innerHTML = "";
            }
        }
    }
}