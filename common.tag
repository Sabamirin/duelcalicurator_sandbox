//<script>
    const observer = riot.observable();
    var commonFunc = {
        init: function () {
            console.log("mixin!!")
        },
        parceInput: function (expression) {
            let returnValue;
            const fixedExpression = expression.replace(/[A-z%]/, "")
            try {
                returnValue = new Function('return ' + fixedExpression)();
            } catch (error) {
                return {
                    "isFinished": false,
                    "value": 0,
                    "percedExpression": "Error"
                }
            }
            if (isNaN(returnValue)) {
                return {
                    "isFinished": false,
                    "value": 0
                }
            } else {
                return {
                    "isFinished": true,
                    "value": returnValue - 0
                }
            }
        }
    }
//</script>